# Ensure git settings live under ~/.config
mkdir -p ~/.config/git
touch ~/.config/git/config

# Set common git aliases and settings
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true
git config --global init.defaultBranch master

# Set identification only if not already configured
if [[ -z "$(git config --global --get user.name 2>/dev/null)" ]]; then
  [[ -n "${ARCHBRIGADE_USER_NAME//[[:space:]]/}" ]] && git config --global user.name "$ARCHBRIGADE_USER_NAME"
fi

if [[ -z "$(git config --global --get user.email 2>/dev/null)" ]]; then
  [[ -n "${ARCHBRIGADE_USER_EMAIL//[[:space:]]/}" ]] && git config --global user.email "$ARCHBRIGADE_USER_EMAIL"
fi
