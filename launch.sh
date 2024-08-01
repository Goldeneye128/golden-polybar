#!/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
killall -q polybar
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
for m in $(polybar --list-monitors | cut -d":" -f1); do
    echo "---" | tee -a /tmp/polybar.log
    MONITOR=$m polybar --reload mybar 2>&1 | tee -a /tmp/polybar.log & disown &
done
