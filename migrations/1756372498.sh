echo "Add eza themeing"

mkdir -p ~/.config/eza

if [ -f ~/.config/archbrigade/current/theme/eza.yml ]; then
  ln -snf ~/.config/archbrigade/current/theme/eza.yml ~/.config/eza/theme.yml
fi

