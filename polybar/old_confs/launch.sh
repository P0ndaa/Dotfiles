#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	for m in $(xrandr -q | grep " connected" | cut -d' ' -f1); do
		MONITOR=$m polybar --reload -c ~/.config/polybar/old_confs/config block &
	done
else
	polybar --reload -c ~/.config/polybar/old_confs/config block &
fi

# Launch bar1 and bar2
