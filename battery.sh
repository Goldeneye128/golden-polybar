#!/bin/bash

# Read the battery capacity
capacity=$(cat /sys/class/power_supply/BAT0/capacity)

# Read the battery status (Charging/Discharging/Full)
status=$(cat /sys/class/power_supply/BAT0/status)

# Define a message based on the status
if [ "$status" == "Charging" ] || [ "$status" == "Full" ]; then
    icon_charging="󰚥"
else
    icon_charging="󰚦"
fi

# Define the battery level icon based on capacity
if [ "$capacity" -ge 75 ]; then
    icon_battery="󱊦"  # Full battery
elif [ "$capacity" -ge 50 ]; then
    icon_battery="󱊥"  # Two bars
elif [ "$capacity" -ge 25 ]; then
    icon_battery="󱊤"  # One bar
else
    icon_battery="󰢟"  # Empty battery
fi

# Print the capacity
echo "$icon_battery $capacity% $icon_charging"
