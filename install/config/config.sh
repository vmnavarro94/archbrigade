# Copy over ArchBrigade configs
mkdir -p ~/.config
cp -R ~/.local/share/archbrigade/config/* ~/.config/

# Walker config needs actual home path (doesn't expand ~ or $HOME)
sed -i "s|\\\$HOME|$HOME|g" ~/.config/walker/config.toml

# Use default bashrc from ArchBrigade
cp ~/.local/share/archbrigade/default/bashrc ~/.bashrc

# Use default zshrc from ArchBrigade and set zsh as default shell
if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.bak
  echo "Existing .zshrc backed up to ~/.zshrc.bak"
fi
cp ~/.local/share/archbrigade/default/zshrc ~/.zshrc
sudo usermod -s /bin/zsh "$USER"
