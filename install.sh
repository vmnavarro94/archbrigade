#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define ArchBrigade locations
export ARCHBRIGADE_PATH="$HOME/.local/share/archbrigade"
export ARCHBRIGADE_INSTALL="$ARCHBRIGADE_PATH/install"
export ARCHBRIGADE_INSTALL_LOG_FILE="/var/log/archbrigade-install.log"
export PATH="$ARCHBRIGADE_PATH/bin:$PATH"

# Install
source "$ARCHBRIGADE_INSTALL/helpers/all.sh"
source "$ARCHBRIGADE_INSTALL/preflight/all.sh"
source "$ARCHBRIGADE_INSTALL/packaging/all.sh"
source "$ARCHBRIGADE_INSTALL/config/all.sh"
source "$ARCHBRIGADE_INSTALL/login/all.sh"
source "$ARCHBRIGADE_INSTALL/post-install/all.sh"
