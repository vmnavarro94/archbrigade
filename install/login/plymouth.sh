#!/usr/bin/env bash

# ==============================================================================
# ArchBrigade SDDM + Plymouth Setup (for non-encrypted disks)
# ==============================================================================

# ------------------------------
# 1. Plymouth theme setup
# ------------------------------
PLYMOUTH_THEME="archbrigade"

if [ "$(plymouth-set-default-theme)" != "$PLYMOUTH_THEME" ]; then
    sudo cp -r "$HOME/.local/share/archbrigade/default/plymouth" "/usr/share/plymouth/themes/$PLYMOUTH_THEME/"
    sudo plymouth-set-default-theme "$PLYMOUTH_THEME"
    sudo mkinitcpio -P
    echo "Plymouth theme set to $PLYMOUTH_THEME."
fi

# ------------------------------
# 2. Install and enable SDDM
# ------------------------------
if ! command -v sddm &>/dev/null; then
    sudo pacman -S --needed sddm
fi

sudo systemctl enable sddm.service
sudo systemctl set-default graphical.target
echo "SDDM enabled and set as default graphical target."

# ------------------------------
# 3. Remove any previous auto-login config
# ------------------------------
SDDM_CONF_DIR="/etc/sddm.conf.d"
AUTO_CONF="$SDDM_CONF_DIR/archbrigade-autologin.conf"

if [ -f "$AUTO_CONF" ]; then
    sudo rm "$AUTO_CONF"
    echo "Removed SDDM auto-login config to require user login."
fi

# ------------------------------
# 4. Install qylock (SDDM + quickshell lockscreen with pixel-hollowknight theme)
# ------------------------------
SDDM_THEME="pixel-hollowknight"
QYLOCK_DEST="$HOME/.local/share/quickshell-lockscreen"

if [[ ! -d "/usr/share/sddm/themes/$SDDM_THEME" ]]; then
    echo "Installing qylock lockscreen and $SDDM_THEME SDDM theme..."
    QYLOCK_TMP=$(mktemp -d)
    trap "rm -rf '$QYLOCK_TMP'" EXIT

    git clone --depth 1 https://github.com/Darkkal44/qylock.git "$QYLOCK_TMP"

    # Install the SDDM theme
    sudo cp -r "$QYLOCK_TMP/themes/$SDDM_THEME" "/usr/share/sddm/themes/$SDDM_THEME"

    # Install the quickshell lockscreen wrapper
    rm -rf "$QYLOCK_DEST"
    cp -r "$QYLOCK_TMP/quickshell-lockscreen" "$QYLOCK_DEST"
    chmod +x "$QYLOCK_DEST/lock.sh"
    # Point themes_link to /usr/share/sddm/themes (shared with SDDM)
    ln -sfn /usr/share/sddm/themes "$QYLOCK_DEST/themes_link"

    echo "qylock installed."
fi

# Configure SDDM to use the theme
SDDM_CONF="/etc/sddm.conf"
if [ -f "$SDDM_CONF" ]; then
    if grep -q "^\[Theme\]" "$SDDM_CONF"; then
        sudo sed -i "s/^Current=.*/Current=$SDDM_THEME/" "$SDDM_CONF"
    else
        echo -e "\n[Theme]\nCurrent=$SDDM_THEME" | sudo tee -a "$SDDM_CONF" > /dev/null
    fi
else
    echo -e "[Theme]\nCurrent=$SDDM_THEME" | sudo tee "$SDDM_CONF" > /dev/null
fi
echo "SDDM theme set to $SDDM_THEME."

# ------------------------------
# 5. Plymouth + SDDM integration
# ------------------------------
# Plymouth quits automatically when graphical.target is reached
echo "Plymouth splash will remain until SDDM starts. User will now be prompted to log in."
