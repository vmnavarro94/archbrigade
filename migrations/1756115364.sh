echo "Replace buggy native Zoom client with webapp"

if archbrigade-pkg-present zoom; then
  archbrigade-pkg-drop zoom
  archbrigade-webapp-install "Zoom" https://app.zoom.us/wc/home https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/zoom.png
fi
