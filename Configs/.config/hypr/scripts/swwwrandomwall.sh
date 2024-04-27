#!/bin/env bash

# BUG: sometimes 'swww' just crashes:
# fix:
# (https://github.com/LGFae/swww/issues/108#issuecomment-1615371691)
# mv ~/.cache/swww/eDP-1 ~/.cache/swww/eDP-1.save
# rm /var/run/user/1000/swww.socket
# swww-daemon &

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script is in bash (not posix shell), because the RANDOM variable
# we use is not defined in posix

if [[ $# -lt 1 ]] || [[ ! -d $1 ]]; then
  echo "Usage:
	$0 <dir containing images>"
  exit 1
fi

swww query &>/dev/null
if [ $? -ne 0 ]; then
  swww-daemon --format xrgb &
fi

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=4

# This controls (in seconds) when to switch to the next image
INTERVAL=1200 # every 20 min

while true; do
  find "$1" -type f |
    while read -r img; do
      echo "$((RANDOM % 1000)):$img"
    done |
    sort -n | cut -d':' -f2- |
    while read -r img; do
      swww img "$img" --transition-type random
      sleep $INTERVAL
    done
done
