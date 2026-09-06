#!/bin/sh
dir="$HOME/Screenshots"
mkdir -p "$dir"
file="$dir/$(date +%Y-%m-%d_%H-%M-%S).png"

case "$1" in
    select) maim -u -b 2 -c 0.64,0.74,0.55,0.4 -s "$file" || exit 1 ;;
    *) maim -u "$file" || exit 1 ;;
esac

xclip -selection clipboard -t image/png -i "$file"
