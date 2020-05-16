#!/bin/bash
if pgrep -x "compton" > /dev/null
then
	killall picom
else
	picom
fi
