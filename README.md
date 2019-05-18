# INSTRUCTIONs

1. This script must be run as root
2. Port 80 has to be available (no other web-services on the host machine)
3. Prepare a file in the format: FULL\_PATH\_VIDEO VIDEO\_DURATION STOP\_TIME (pay attention to spaces between values!)
4. All times must be pass in seconds

# GOAL
This script will launch a VLC instance every STOP\_TIME playing video in the list (in series) starting from a random start time in the interval 
[ 1 - VIDEO\_DURATION ].  
On the client-side please run a vlc instance in the format  
	`vlc --loop http://[SEERVER_IP]:80/test`  
Loop option allow the client video-player to play continously the available video.
