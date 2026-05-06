echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/archbrigade/themes/osaka-jade ]]; then
  rm -rf ~/.config/archbrigade/themes/osaka-jade
  git -C ~/.local/share/archbrigade checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/archbrigade/themes/osaka-jade ~/.config/archbrigade/themes/osaka-jade
fi
