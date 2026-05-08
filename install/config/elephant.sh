# Enable elephant service (provided by elephant-all package)
if command -v elephant &>/dev/null; then
  elephant service enable 2>/dev/null || true
  systemctl --user start elephant 2>/dev/null || true
fi
