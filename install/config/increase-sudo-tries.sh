# Give the user 10 instead of 3 tries before lockout (idempotent)
if [[ ! -f /etc/sudoers.d/passwd-tries ]]; then
  echo "Defaults passwd_tries=10" | sudo tee /etc/sudoers.d/passwd-tries
  sudo chmod 440 /etc/sudoers.d/passwd-tries
fi
