echo "Install swayOSD to show volume status"

if archbrigade-cmd-missing swayosd-server; then
  archbrigade-pkg-add swayosd
  setsid uwsm app -- swayosd-server &>/dev/null &
fi
