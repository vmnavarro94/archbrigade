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
# 4. SDDM theme
# ------------------------------
SDDM_CONF="/etc/sddm.conf"
SDDM_THEME="pixel-hollowknight"

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
