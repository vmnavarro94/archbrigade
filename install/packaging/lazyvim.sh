if [[ ! -d "$HOME/.config/nvim" ]]; then
  echo "Installing LazyVim starter..."
  git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
  rm -rf "$HOME/.config/nvim/.git"
fi
