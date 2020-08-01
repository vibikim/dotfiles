#!/bin/sh

 # change the desktop number here
 FD9=$(bspc query -D -d '^9')
 FD8=$(bspc query -D -d '^9')
 FD7=$(bspc query -D -d '^9')

 bspc subscribe node_add | while read msg ; do
    desk_id=${msg[2]}
    wid=${msg[4]}
    for i in $FD7 $FD8 $FD9
    do
	    [ "$i" = "$desk_id" ] && bspc node "$wid" -t floating
    done
 done
