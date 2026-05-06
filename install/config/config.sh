# Copy over Omarchy configs
mkdir -p ~/.config
cp -R ~/.local/share/omarchy/config/* ~/.config/

# Use default bashrc from Omarchy
cp ~/.local/share/omarchy/default/bashrc ~/.bashrc

# Use default zshrc from Omarchy and set zsh as default shell
if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.bak
  echo "Existing .zshrc backed up to ~/.zshrc.bak"
fi
cp ~/.local/share/omarchy/default/zshrc ~/.zshrc
chsh -s /bin/zsh "$USER"
