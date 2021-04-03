# !/bin/bash

bat_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
bat_status=$(cat /sys/class/power_supply/BAT0/status)
if [ $bat_capacity -lt ${1:-11} ] && [ $bat_status = 'Discharging' ]; then
  systemctl poweroff
fi
