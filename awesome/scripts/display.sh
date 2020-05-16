#!/bin/sh

choices="arandr\nLVDS_off\ndual\nLVDS_on"

chosen=$(echo -e "$choices" | dmenu -i)

case "$chosen" in
	arandr) arandr ;;
	LVDS_off) xrandr --output LVDS-1-1 --off & ;;
	dual) xrandr --output DP-4 --auto --output LVDS-1-1 --right-of DP-4 ;;
	LVDS_on) xrandr --output LVDS-1-1 --auto ;;
esac
