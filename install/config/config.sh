# Copy over ArchBrigade configs
mkdir -p ~/.config
cp -R ~/.local/share/archbrigade/config/* ~/.config/

# Use default bashrc from ArchBrigade
cp ~/.local/share/archbrigade/default/bashrc ~/.bashrc

# Use default zshrc from ArchBrigade and set zsh as default shell
if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.bak
  echo "Existing .zshrc backed up to ~/.zshrc.bak"
fi
cp ~/.local/share/archbrigade/default/zshrc ~/.zshrc
chsh -s /bin/zsh "$USER"
