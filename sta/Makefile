build: config.h
	cc -w -o sta sta.c ./components/* -pthread

config.h:
	cp config.def.h config.h

install: build
	cp sta /usr/local/bin

uninstall:
	rm -f /usr/local/bin/sta
clean:
	rm -f ./sta  
