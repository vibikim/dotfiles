#!/usr/bin/sh

## Add this to your wm startup file.

# Terminate already running bar instances
#killall -q polybar

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar main -c ~/.config/polybar/config.ini &


if [ -z "`pgrep -x polybar`" ]; then
	BAR="main"
	#Detect if DP or internal laptop displays are connected and show a polybar for them
	#TODO look at the other laptop for the name of the HDMI output
	for m in $(polybar -m | grep "\(DP\|LVDS\|eDP\|DisplayPort\)" | cut -d ':' -f1); do
		MONITOR=$m
		polybar --reload $BAR -c ~/.config/polybar/config.ini &
		sleep 1
	done
else
	polybar-msg cmd restart
fi
