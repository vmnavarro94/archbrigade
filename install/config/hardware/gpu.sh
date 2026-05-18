#!/bin/bash

GPU=$(lspci 2>/dev/null | grep -iE 'vga|3d|display')

if echo "$GPU" | grep -qi 'amd\|radeon'; then
  echo "AMD GPU detected, installing Mesa + Vulkan + VA-API drivers..."
  sudo pacman -S --needed --noconfirm \
    mesa \
    vulkan-radeon \
    libva-mesa-driver \
    mesa-vdpau \
    xf86-video-amdgpu
elif echo "$GPU" | grep -qi 'intel'; then
  echo "Intel GPU detected, installing Mesa + VA-API drivers..."
  bash "$(dirname "$0")/intel.sh"
fi
