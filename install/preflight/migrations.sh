ARCHBRIGADE_MIGRATIONS_STATE_PATH=~/.local/state/archbrigade/migrations
mkdir -p $ARCHBRIGADE_MIGRATIONS_STATE_PATH

for file in ~/.local/share/archbrigade/migrations/*.sh; do
  touch "$ARCHBRIGADE_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
