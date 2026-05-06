source $ARCHBRIGADE_INSTALL/preflight/guard.sh
source $ARCHBRIGADE_INSTALL/preflight/begin.sh
run_logged $ARCHBRIGADE_INSTALL/preflight/show-env.sh
run_logged $ARCHBRIGADE_INSTALL/preflight/pacman.sh
run_logged $ARCHBRIGADE_INSTALL/preflight/migrations.sh
run_logged $ARCHBRIGADE_INSTALL/preflight/first-run-mode.sh
run_logged $ARCHBRIGADE_INSTALL/preflight/disable-mkinitcpio.sh
