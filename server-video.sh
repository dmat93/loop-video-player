#!/bin/bash
if [ "$1" = "" ];
then
	echo " "
	echo "======================================================================"
        echo "  Pass variable from command line in sequence:"
        echo "     1. Video list name containing : [full_path_source] [video_duration] [sleep_time]"
	echo "     Run command as SUDO and make free port 80"
	echo ""
	echo "     The stream will be available at [http://SERVER_IP:80/test]"
	echo "======================================================================"
	echo " "
else
	list=$1
	z=$(cat $list | wc -l)
	for i in `seq 1 $z`
	do
		path=$(sed -n $(echo $i)p $list | awk '{print $1}')
		to=$(sed -n $(echo $i)p $list | awk '{print $3}')
		vd=$(sed -n $(echo $i)p $list | awk '{print $2}')
		st=$(shuf -i1-$(echo $vd) -n1)
		vlc-wrapper --quiet --no-audio --start-time $st $path --sout='#standard{mux=ts,access=http,dst=:80/test}' &
		sleep $to
		pkill -f -- "vlc"
		sleep 1
	done
fi
