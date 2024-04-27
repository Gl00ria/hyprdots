#!/usr/bin/env bash
#|---/ /+-----------------------------------------------+---/ /|#
#|--/ /-| Script to enable early loading for nvidia drm |--/ /-|#
#|-/ /--| Prasanth Rangan                               |-/ /--|#
#|/ /---+-----------------------------------------------+/ /---|#

# WARN: modified to work with (dracut)
if [ $(lspci -k | grep -A 2 -E "(VGA|3D)" | grep -i nvidia | wc -l) -gt 0 ]; then
  ### dracut
  echo "\033[0;33m[COPY]\033[0m (Configs/etc/dracut.conf.d/nvidia.conf) \033[0;33m-->\033[0m (/etc/dracut.conf.d/)"
  sudo cp "${scrDir}/Configs/etc/dracut.conf.d/nvidia.conf" /etc/dracut.conf.d/
  echo "\033[0;33m[REBUILD]\033[0m DRACUT"
  sudo sudo dracut-rebuild
  echo "\033[0;33m[Enable]\033[0m nvidia(suspend, hibernate & resume) services"
  sudo systemctl enable nvidia-suspend.service
  sudo systemctl enable nvidia-hibernate.service
  sudo systemctl enable nvidia-resume.service
  # if [ $(grep 'MODULES=' /etc/mkinitcpio.conf | grep nvidia | wc -l) -eq 0 ]; then
  #   sudo sed -i "/MODULES=/ s/)$/ nvidia nvidia_modeset nvidia_uvm nvidia_drm)/" /etc/mkinitcpio.conf
  #   sudo mkinitcpio -P
  #   if [ $(grep 'options nvidia-drm modeset=1' /etc/modprobe.d/nvidia.conf | wc -l) -eq 0 ]; then
  #     echo 'options nvidia-drm modeset=1' | sudo tee -a /etc/modprobe.d/nvidia.conf
  #   fi
  # fi
fi
