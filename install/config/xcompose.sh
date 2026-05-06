# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/archbrigade/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$ARCHBRIGADE_USER_NAME"
<Multi_key> <space> <e> : "$ARCHBRIGADE_USER_EMAIL"
EOF
