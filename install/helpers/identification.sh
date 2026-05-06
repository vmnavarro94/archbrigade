#!/bin/bash
# Clear any previous clutter
clear

# Optionally, re-print your logo
clear_logo

# Ask for name
if [ -z "$ARCHBRIGADE_USER_NAME" ]; then
  export ARCHBRIGADE_USER_NAME=$(gum input \
    --placeholder "Enter full name" \
    --prompt "Name> ")
fi

# Ask for email
if [ -z "$ARCHBRIGADE_USER_EMAIL" ]; then
  export ARCHBRIGADE_USER_EMAIL=$(gum input \
    --placeholder "Enter email address" \
    --prompt "Email> ")
fi

echo # Ensure we end with a positive exit
