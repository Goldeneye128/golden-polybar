#!/bin/bash

# Check for tun0 interface created by OpenConnect
if ip addr show tun0 > /dev/null 2>&1; then
    echo "VPN - 󰌾 "
else
    echo "VPN - 󱙱 "
fi
