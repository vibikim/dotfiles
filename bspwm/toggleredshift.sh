#!/bin/sh

if [ -z "`pgrep -x redshift`" ]; then
	redshift -l 44:26 &
	notify-send Redshift "is now enabled"
else
	notify-send Redshift "is now disabled"
	pkill redshift
fi
