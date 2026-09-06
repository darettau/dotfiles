#!/usr/bin/env bash

ACCENT=a3be8cff
DARK=000000ff
LIGHT=eeeeeeff
RED=d35f5eff
CLEAR=00000000
FONT="JetBrainsMono Nerd Font"
BG="/tmp/.lockbg-$UID.png"
read -r W H < <(xdpyinfo | awk '/dimensions:/{split($2,a,"x"); print a[1], a[2]}')

if maim -u -q "$BG" 2>/dev/null; then
    magick "$BG" -resize 12% -blur 0x5 -resize "${W}x${H}!" -fill black -colorize 70% "$BG" 2>/dev/null \
        && IMG=(-c 000000 -i "$BG") || IMG=(-c 000000)
else
    IMG=(-c 000000)
fi

i3lock -n "${IMG[@]}" \
    --clock --force-clock --indicator \
    --radius 110 --ring-width 6 \
    --inside-color="$DARK" \
    --ring-color="$ACCENT" \
    --insidever-color="$DARK" \
    --ringver-color="$LIGHT" \
    --insidewrong-color="$DARK" \
    --ringwrong-color="$RED" \
    --line-uses-inside \
    --keyhl-color="$LIGHT" \
    --bshl-color="$RED" \
    --separator-color="$CLEAR" \
    --time-str="%H:%M" \
    --time-font="$FONT" --time-size=32 --time-color="$LIGHT" \
    --date-str="%a, %d %B" \
    --date-font="$FONT" --date-size=13 --date-color="$ACCENT" \
    --date-pos="ix:iy+42" \
    --keylayout 2 \
    --layout-font="$FONT" --layout-size=14 --layout-color="$ACCENT" \
    --layout-pos="ix:iy+r+40" \
    --verif-text="" --wrong-text="" --noinput-text="" --greeter-text="" \
    --pass-media-keys --pass-volume-keys

rm -f "$BG"
