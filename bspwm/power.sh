#!/bin/sh

sure() {
	options="Yes
	No"

	chosen=`echo "$options" | dmenu -i -p "Are you sure?" -sb red -sf black`
	case "$chosen" in
		Yes) exec $1 ;;
		No) exit ;;
	esac
	}
options="shutdown
reboot
hibernate
sleep"

chosen=`echo "$options" | dmenu -i`

case "$chosen" in
	shutdown)
		sure "systemctl poweroff" ;;
	reboot)	
		sure "systemctl reboot" ;;
	hibernate)
		sure "systemctl hibernate" ;;
	sleep)
		systemctl suspend ;;
esac
