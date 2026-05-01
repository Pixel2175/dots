#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>
#include <pthread.h>
#include <string.h>
#include <errno.h>

#define SOCKET_PATH "/tmp/sta.sock"

typedef struct{
	const char *(*func)(const char *);
	char *fmt;
	char *parm;
	int id;
	int delay;
}Args;

#include "util.h"
#include "config.h"

pthread_mutex_t list_mutex = PTHREAD_MUTEX_INITIALIZER;

typedef struct {
	int id;
	char *name;
} Pro;

typedef struct {
	Pro *process;
	int count;
} Pros;

typedef struct {
	int id2;
	Pros *list;
} Potato;

Pros *init()
{
	Pros *list = malloc(sizeof(Pros));
	list->process = malloc(sizeof(Pro));
	list->count = 0;
	return list;
}

void add_pro(Pros *list, int id, char *name)
{
	for (int i = 0; i < list->count; ++i) {
		if (id == list->process[i].id) {
			free(list->process[i].name);
			list->process[i].name = strdup(name);
			return;
		}
	}
	list->count++;
	list->process = realloc(list->process, sizeof(Pro) * list->count);
	if (!list->process) {
		warn("Memory: memory allocation failed.");
		exit(1);
	}
	list->process[list->count - 1].name = strdup(name);
	list->process[list->count - 1].id = id;
}

void show_pros(Pros *list)
{
	for (int i = 0; i < list->count - 1; i++) {
		for (int j = i + 1; j < list->count; j++) {
			if (list->process[i].id > list->process[j].id) {
				Pro temp = list->process[i];
				list->process[i] = list->process[j];
				list->process[j] = temp;
			}
		}
	}
	for (int a = 0; a < list->count; ++a)
		printf("%s", list->process[a].name);
	printf("\n");
	fflush(stdout);
}

void usage()
{
	printf("Usage:\n");
	printf("\t-id        <number>       => process id (id >= 1)\n");
	printf("\t-name      <string>       => process name\n");
	printf("\t-h -help                  => print this help menu\n");
	exit(1);
}

static char *fmt_cmd(const char *cmd, char *fmt)
{
	char *buf = malloc(512);
	snprintf(buf, 512, fmt, cmd);
	return buf;
}

void append(Args *command, Pros *list)
{
	const char *cmd = command->func(command->parm);
	if (!cmd) cmd = "N/A";
	char *tmp = fmt_cmd(cmd, command->fmt);
	add_pro(list, command->id, tmp);
	free(tmp);
	show_pros(list);
}

void *worker(void *arg)
{
	Potato *data = arg;
	Args command = commands[data->id2];
	while (1) {
		pthread_mutex_lock(&list_mutex);
		append(&command, data->list);
		pthread_mutex_unlock(&list_mutex);
		usleep(command.delay * 1000);
	}
	return NULL;
}

void run_server(struct sockaddr_un *addr, int sock, Pros *list)
{
	int cmds = sizeof(commands) / sizeof(commands[0]);
	pthread_t tids[cmds];
	for (int i = 0; i < cmds; ++i) {
		if (commands[i].delay) {
			Potato *info = malloc(sizeof(Potato));
			info->list = list;
			info->id2 = i;
			pthread_create(&tids[i], NULL, worker, info);
		} else {
			append(&commands[i], list);
		}
	}

	if (bind(sock, (struct sockaddr *)addr, sizeof(*addr)) < 0)
		warn("Bind: failed: %s", strerror(errno));

	if (listen(sock, 5) < 0)
		warn("Listen failed: %s", strerror(errno));

	while (1) {
		int client = accept(sock, NULL, NULL);
		if (client < 0) continue;

		char buf[256], name[256];
		int n, id;

		while ((n = recv(client, buf, sizeof(buf) - 1, 0)) > 0) {
			buf[n] = '\0';
			char *s = strstr(buf, "|+|");
			if (s) {
				*s = '\0';
				id = atoi(buf);
				strncpy(name, s + 3, sizeof(name) - 1);
				name[sizeof(name) - 1] = '\0';
				add_pro(list, id, name);
				show_pros(list);
			}
		}
		close(client);
	}
}

void run_client(int argc, char const *argv[], struct sockaddr_un *addr, int sock)
{
	int id = -1;
	char *name = NULL;
	char buf[256];

	for (int i = 1; i < argc; i++) {
		if (!strcmp("-h", argv[i]) || !strcmp("-help", argv[i]))
			usage();
		if (!strcmp("-id", argv[i]) && i + 1 < argc)
			id = atoi(argv[++i]);
		else if (!strcmp("-name", argv[i]) && i + 1 < argc)
			name = (char *)argv[++i];
	}

	if (id <= 0)
		usage();

	if (name) {
		snprintf(buf, sizeof(buf), "%d|+|%s", id, name);
	} else {
		buf[0] = '\0';
		for (int i = 0; i < (int)(sizeof(commands) / sizeof(commands[0])); ++i) {
			if (id == commands[i].id) {
				const char *cmd = commands[i].func(commands[i].parm);
				if (!cmd) cmd = "N/A";
				char *tmp = fmt_cmd(cmd, commands[i].fmt);
				snprintf(buf, sizeof(buf), "%d|+|%s", id, tmp);
				free(tmp);
				break;
			}
		}
		if (buf[0] == '\0') {
			warn("client", "no command found for id %d", id);
			return;
		}
	}

	if (connect(sock, (struct sockaddr *)addr, sizeof(*addr)) < 0) {
		warn("Connect: failed: %s", strerror(errno));
		return;
	}
	write(sock, buf, strlen(buf));
}

int main(int argc, char const *argv[])
{
	struct sockaddr_un addr = {0};
	addr.sun_family = AF_UNIX;
	strcpy(addr.sun_path, SOCKET_PATH);

	int sock = socket(AF_UNIX, SOCK_STREAM, 0);
	if (sock < 0)
		warn("Socket: failed to create socket: %s", strerror(errno));

	Pros *list = init();

	for (int i = 1; i < argc; ++i) {
		  if (strcmp(argv[i], "-s") == 0 || strcmp(argv[i], "--server") == 0) {
			if (access(SOCKET_PATH, F_OK) == 0){
				if ( connect(sock, (struct sockaddr *)&addr, sizeof(addr) ) == 0 )
					die("Socket: socket exists and connectable.");		
			}else 
			  unlink(SOCKET_PATH);
			run_server(&addr, sock, list);
		}
	}

	if (access(SOCKET_PATH, F_OK) == 0) {
		run_client(argc, argv, &addr, sock);
	} else {
		die("ERROR: server not running (no socket at " SOCKET_PATH ")");
	}

	close(sock);
	return 0;
}
