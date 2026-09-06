#!/usr/bin/env bash

pidfile="/tmp/autotiling-$UID.pid"
old=$(cat "$pidfile" 2>/dev/null)
[[ -n $old ]] && kill "$old" 2>/dev/null

filter='
  def flat: recurse(.nodes[]?);
  [flat | select(any(.nodes[]?; .focused))] | .[0] as $p
  | ($p.nodes[] | select(.focused)) as $c
  | "\($p.layout) \($c.rect.width) \($c.rect.height) \($c.fullscreen_mode)"
'

retile() {
    local info layout w h fs
    info=$(i3-msg -t get_tree | jq -r "$filter" 2>/dev/null) || return
    read -r layout w h fs <<<"$info"
    [[ $layout == splith || $layout == splitv ]] || return
    [[ $fs == 0 ]] || return
    if (( h > w )); then
        i3-msg -q split v
    else
        i3-msg -q split h
    fi
}

coproc SUB { exec i3-msg -t subscribe -m '["window"]'; }
echo "$SUB_PID" > "$pidfile"
retile

while read -r line <&"${SUB[0]}"; do
    case $(jq -r '.change' <<<"$line" 2>/dev/null) in
        focus|new|move|floating) retile ;;
    esac
done
