#!/bin/bash

# If Rofi is running, close it.
if pgrep -x rofi >/dev/null; then
    pkill -x rofi
    exit 0
fi

# If not running, open it.
rofi -show drun
