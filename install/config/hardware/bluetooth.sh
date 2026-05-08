# Turn on bluetooth by default (skip if no bluetooth hardware)
systemctl list-unit-files bluetooth.service &>/dev/null && chrootable_systemctl_enable bluetooth.service || true
