#!/bin/bash

CPU=$(grep -m1 'model name' /proc/cpuinfo 2>/dev/null || true)

if echo "$CPU" | grep -qi 'intel'; then
  echo "Intel CPU detected, installing intel-ucode..."
  sudo pacman -S --needed --noconfirm intel-ucode
  sudo grub-mkconfig -o /boot/grub/grub.cfg
elif echo "$CPU" | grep -qi 'amd'; then
  echo "AMD CPU detected, installing amd-ucode..."
  sudo pacman -S --needed --noconfirm amd-ucode
  sudo grub-mkconfig -o /boot/grub/grub.cfg
fi
