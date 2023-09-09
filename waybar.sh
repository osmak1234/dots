#!/bin/bash

# Check if Waybar is running
if pgrep -x "waybar" >/dev/null; then
	# Waybar is running, so kill it
	killall waybar
else
	# Waybar is not running, so start it
	waybar &
fi
