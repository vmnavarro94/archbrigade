echo "Add UWSM env"

export ARCHBRIGADE_PATH="$HOME/.local/share/archbrigade"
export PATH="$ARCHBRIGADE_PATH/bin:$PATH"

mkdir -p "$HOME/.config/uwsm/"
archbrigade-refresh-config uwsm/env

echo -e "\n\e[31mArchBrigade bins have been added to PATH (and ARCHBRIGADE_PATH is now system-wide).\nYou must immediately relaunch Hyprland or most ArchBrigade cmds won't work.\nPlease run ArchBrigade > Update again after the quick relaunch is complete.\e[0m"
echo

mkdir -p ~/.local/state/archbrigade/migrations
gum confirm "Ready to relaunch Hyprland? (All applications will be closed)" &&
  touch ~/.local/state/archbrigade/migrations/1751134560.sh &&
  uwsm stop
