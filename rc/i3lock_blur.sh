#!/bin/bash

scrot /tmp/screen_locked.png
convert -blur 2x3 /tmp/screen_locked.png /tmp/screen_locked_blur.png
systemctl suspend
i3lock -i /tmp/screen_locked_blur.png -p default -d -n
