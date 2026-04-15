/* See LICENSE file for copyright and license details. */
#include <stdio.h>
#include <sys/statvfs.h>

#include "../util.h"

const char *
disk_free(const char *path)
{
	static _Thread_local char buf[1024];
	struct statvfs fs;

	if (statvfs(path, &fs) < 0) {
		warn("statvfs '%s':", path);
		return NULL;
	}

	return fmt_human(buf, fs.f_frsize * fs.f_bavail, 1024);
}

const char *
disk_perc(const char *path)
{
	static _Thread_local char buf[1024];
	struct statvfs fs;

	if (statvfs(path, &fs) < 0) {
		warn("statvfs '%s':", path);
		return NULL;
	}

	return bprintf(buf, "%d", (int)(100 *
	               (1 - ((double)fs.f_bavail / (double)fs.f_blocks))));
}

const char *
disk_total(const char *path)
{
	static _Thread_local char buf[1024];
	struct statvfs fs;

	if (statvfs(path, &fs) < 0) {
		warn("statvfs '%s':", path);
		return NULL;
	}

	return fmt_human(buf, fs.f_frsize * fs.f_blocks, 1024);
}

const char *
disk_used(const char *path)
{
	static _Thread_local char buf[1024];
	struct statvfs fs;

	if (statvfs(path, &fs) < 0) {
		warn("statvfs '%s':", path);
		return NULL;
	}

	return fmt_human(buf, fs.f_frsize * (fs.f_blocks - fs.f_bfree), 1024);
}
