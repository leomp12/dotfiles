#!/bin/bash

# Check HDMI and setup
(xrandr | grep 'HDMI-1 connected') && ~/.bin/hdmi-on wide && ~/.bin/switch-keyboard
