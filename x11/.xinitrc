export QT_QPA_PLATFORMTHEME=qt5ct
export LANG=en_US.UTF-8
export XDG_SESSION_TYPE=x11
export XCURSOR_THEME=Vimix-cursors
export XCURSOR_SIZE=24

systemctl --user import-environment DISPLAY XAUTHORITY XDG_SESSION_TYPE XCURSOR_THEME XCURSOR_SIZE
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XDG_SESSION_TYPE XCURSOR_THEME XCURSOR_SIZE 2>/dev/null

/usr/lib/xdg-desktop-portal-xapp &
sleep 1
/usr/lib/xdg-desktop-portal &
sleep 1

exec i3
