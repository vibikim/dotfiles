#!/bin/sh
#TODO option to  get existing area and shrink it

choices="4:3\nMain screen\nSecond screen"

chosen=$(echo -e "$choices" | dmenu -i)

case "$chosen" in
	4:3) xsetwacom set "Wacom Intuos S 2 Pen stylus" Area 0 0 11400 8550 ;;
	Main screen) xsetwacom set "Wacom Intuos S 2 Pen stylus" MapToOutput HEAD-0 ;;
	second screen) xsetwacom set "Wacom Intuos S 2 Pen stylus" MapToOutput HEAD-1 ;;
esac
