#!/bin/bash

BRIGHTNESS=
if [[ $1 == "up" ]] then
  BRIGHTNESS=$(brightnessctl s +5% | grep -Eo "[0-9]*%")
elif [[ $1 == "down" ]]; then
  BRIGHTNESS=$(brightnessctl s 5%- | grep -Eo "[0-9]*%")
fi

BRIGHTNESS=${BRIGHTNESS%%%}
ICON=$HOME/.config/hypr/icons/icons8-sun.svg

dunstify -t 2000 -i $THEME/$ICON -h string:x-canonical-private-synchronous:brightness "$BRIGHTNESS%" -h int:value:$BRIGHTNESS
