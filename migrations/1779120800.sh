echo "Install GPU drivers (AMD/Intel) and CPU microcode if not already present"

source "$ARCHBRIGADE_PATH/install/config/hardware/gpu.sh"
source "$ARCHBRIGADE_PATH/install/config/hardware/cpu-microcode.sh"
source "$ARCHBRIGADE_PATH/install/config/hardware/intel.sh"
