# STA
**STA** is a minimal status monitor written in C.

## About
STA is inspired by slstatus. The core code is fully rewritten; only the config structure (with some edits) and the status-fetching functions are from slstatus.

## How it works
STA runs as a server (daemon) using a UNIX socket and waits for updates from clients.
You can update any status by specifying its ID from the config file, then run:
```
sta -id <ID>
```

This sends a signal to the socket and refreshs the status.
You can configure the displayed status in `config.def.h`.

### Example
```bash
# Start the server
sta -s

# Send a status update
sta -id 1
```

This sends the current time (or other info) to the server with a unique ID.
Rerun the command whenever you want to update the status.

> **Note:** STA was created for learning purposes.
