#!/bin/dash

choices="arandr\nLVDS_off\nLVDS_on\ndual"

chosen=$(echo "$choices" | dmenu -i)

case "$chosen" in
	arandr) arandr ;;
	LVDS_off) xrandr --output LVDS-1-1 --off & ;;
	LVDS_on) xrandr --output LVDS-1-1 --auto ;;
	dual) xrandr --output VGA-0 --mode 1024x768 --pos 1920x312 --rotate normal --output LVDS-0 --off --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --off --output LVDS-1-1 --off --output VGA-1-1 --off ;;
esac
