echo "Install qylock lockscreen and pixel-hollowknight SDDM theme"

SDDM_THEME="pixel-hollowknight"
QYLOCK_DEST="$HOME/.local/share/quickshell-lockscreen"

# Install qylock deps
archbrigade-pkg-add qt6-5compat qt6-multimedia qt6-multimedia-ffmpeg qt6-svg \
  gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly

if [[ ! -d "/usr/share/sddm/themes/$SDDM_THEME" ]] || [[ ! -d "$QYLOCK_DEST" ]]; then
  QYLOCK_TMP=$(mktemp -d)
  trap "rm -rf '$QYLOCK_TMP'" EXIT

  git clone --depth 1 https://github.com/Darkkal44/qylock.git "$QYLOCK_TMP"

  # Install/update SDDM theme
  sudo cp -r "$QYLOCK_TMP/themes/$SDDM_THEME" "/usr/share/sddm/themes/$SDDM_THEME"

  # Install/update quickshell lockscreen wrapper
  rm -rf "$QYLOCK_DEST"
  cp -r "$QYLOCK_TMP/quickshell-lockscreen" "$QYLOCK_DEST"
  chmod +x "$QYLOCK_DEST/lock.sh"
  ln -sfn /usr/share/sddm/themes "$QYLOCK_DEST/themes_link"

  echo "qylock installed successfully."
fi
