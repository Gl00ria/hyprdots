#!/usr/bin/env bash

#  ╔══════════════════════════════════════════════════════════╗
#  ║                reset XDPH for screenshare                ║
#  ╚══════════════════════════════════════════════════════════╝
sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal-kde
killall xdg-desktop-portal-lxqt
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal
sleep 1
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &

#  ╒══════════════════════════════════════════════════════════╕
#  │                           XDPH                           │
#  ╘══════════════════════════════════════════════════════════╛
# https://wiki.hyprland.org/FAQ/#some-of-my-apps-take-a-really-long-time-to-open
# https://gist.github.com/PowerBall253/2dea6ddf6974ba4e5d26c3139ffb7580
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
dbus-update-activation-environment --systemd --all &
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &

#  ╔══════════════════════════════════════════════════════════╗
#  ║        Policy Authentication Agent (Gnome | KDE)         ║
#  ╚══════════════════════════════════════════════════════════╝
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/polkit-kde-authentication-agent-1 & # authentication dialogue for GUI apps

#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃                           BARS                           ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
# waybar
waybar &

# Gbar
# gBar bar 0 & # main monitor
# gBar bar 1 & # secondary monitor

#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃                         Applets                          ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
blueman-applet &                      # systray app for Bluetooth
udiskie --no-automount --smart-tray & # front-end that allows to manage removable media
nm-applet --indicator &               # systray app for Network/Wifi

#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃                      Notifications                       ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
# dunst &
swaync &

# battery notification
~/.config/hypr/scripts/batterynotify.sh &

#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃                        Wallpaper                         ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
# wpaperd & # SlideShow

# ~/.config/hypr/scripts/swwwallpaper.sh &   # start wallpaper daemon
~/.config/hypr/scripts/swwwrandomwall.sh ~/Pictures/wallpapers/ & # start wallpaper daemon
#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃  OSD window for common actions like volume and capslock  ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
# (https://github.com/ErikReider/SwayOSD)
exec swayosd-server &

#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃                          Utils                           ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
# idle
hypridle &

# idle
# swayidle -w timeout 600 "swaylock" before-sleep "swaylock" & # lock screen after 10 min of idle
# swayidle -w timeout 1200 "systemctl hibernate" &             # hibernate after 20 mins of idle

# touchpad gestures
# libinput-gestures-setup start &

#  ╔══════════════════════════════════════════════════════════╗
#  ║            stores password & encryption keys             ║
#  ╚══════════════════════════════════════════════════════════╝
# eval "$(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)"
# export "$(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)"

# export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh

#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃                         Widgets                          ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
# eww
# eww daemon
