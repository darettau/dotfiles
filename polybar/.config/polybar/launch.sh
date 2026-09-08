#!/usr/bin/env bash

killall -q polybar
sleep 2
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar top 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar loading ..."
