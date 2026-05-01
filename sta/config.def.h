/*
 * if delay = 0: it will run ones and stop, so you need to  send signle to update it 
 * id is a unique number that lets u edit the specifice command
 *
 *
 */

static const Args commands[] = {
	// format     command      id             delay
	{run_command  , " %s "     , "date +%H:%M", 1, 60*1000},
	{run_command  , " %s                                          ", "date +'%b %d'", 2, 60*1000},
	{battery_state, " %s "     , "BAT1", 3, 1000},
	{battery_perc , "   %s% │", "BAT1", 4, 60*2000},
	{run_command  , "   %s │" , "brightnessctl | grep Current | awk '{print $4}' | tr -d '()'", 5, 0},
	{run_command  , "   %s │" , "pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1", 6, 0},
	{ram_used     , "   %s │" , NULL, 9, 1000},
	{disk_perc    , "   %s% │", "/home/", 10, 60*1000},
	{wifi_essid   , "   %s │" , "wlan0", 11, 60*1000},
	{run_command  , "   %s  " , "python /home/pixel/.src/scripts/server.py", 12, 1000},

};
