/* See LICENSE file for copyright and license details. */
#include <stdio.h>
#include <string.h>

const char *
run_command(const char *cmd)
{
	static _Thread_local char buf[1024];
	char *p;
	FILE *fp;

	if (!(fp = popen(cmd, "r"))) {
		fprintf(stderr,"error '%s':", cmd);
		return "";
	}

	p = fgets(buf, sizeof(buf) - 1, fp);
	if (pclose(fp) < 0) {
		fprintf(stderr,"pclose '%s':", cmd);
		return "";
	}
	if (!p)
		return "";

	if ((p = strrchr(buf, '\n')))
		p[0] = '\0';

	return buf[0] ? buf : "";
}
