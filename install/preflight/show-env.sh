# Show installation environment variables
gum log --level info "Installation Environment:"

env | grep -E "^(ARCHBRIGADE_CHROOT_INSTALL|ARCHBRIGADE_ONLINE_INSTALL|ARCHBRIGADE_USER_NAME|ARCHBRIGADE_USER_EMAIL|USER|HOME|ARCHBRIGADE_REPO|ARCHBRIGADE_REF|ARCHBRIGADE_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done
