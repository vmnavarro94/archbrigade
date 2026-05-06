echo "Replace wofi with walker as the default launcher"

if archbrigade-cmd-missing walker; then
  archbrigade-pkg-add walker-bin libqalculate

  archbrigade-pkg-drop wofi
  rm -rf ~/.config/wofi

  mkdir -p ~/.config/walker
  cp -r ~/.local/share/archbrigade/config/walker/* ~/.config/walker/
fi
