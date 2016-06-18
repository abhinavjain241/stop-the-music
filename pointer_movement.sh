#!/bin/bash
dist_thresh=100 #Set threshold for pointer distance here - (Euclidean)
time_thresh=10 #Set away time here in seconds
resolution_factor=58 #Resolution factor calculated experimentally for xdotool
interval_thresh=$((${time_thresh}*${resolution_factor})) #This actually gives the upper limit of the counter after which the song will pause
COUNT=0

while true; do
	pos_init=$(xdotool getmouselocation 2>&1 | sed -rn '${s/x:([0-9]+) y:([0-9]+) .*/\1 \2/p}')
	pos_fin=$(xdotool getmouselocation 2>&1 | sed -rn '${s/x:([0-9]+) y:([0-9]+) .*/\1 \2/p}')
	posarray_init=($pos_init)
	posarray_fin=($pos_fin)
	diff_x=$((${posarray_fin[0]}-${posarray_init[0]}))
	diff_y=$((${posarray_fin[1]}-${posarray_init[1]}))
	dist=$((${diff_x}*${diff_x} + ${diff_y}*${diff_y}))
	if [ "$dist" -lt "$dist_thresh" ]
	then
		COUNT=$((COUNT + 1))
		# Uncomment below for debugging
		# echo $COUNT
		if [ "$COUNT" -eq "$interval_thresh" ]
		then
			rhythmbox-client --pause # Insert CLI command for your fav. music player. I use Rhythmbox.
		fi
	else
		COUNT=0
		rhythmbox-client --play # Same here
	fi
done
