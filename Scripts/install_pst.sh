#!/usr/bin/env bash
#|---/ /+--------------------------------------+---/ /|#
#|--/ /-| Script to apply post install configs |--/ /-|#
#|-/ /--| Prasanth Rangan                      |-/ /--|#
#|/ /---+--------------------------------------+/ /---|#

scrDir=$(dirname "$(realpath "$0")")
source "${scrDir}/global_fn.sh"
if [ $? -ne 0 ]; then
  echo "Error: unable to source global_fn.sh..."
  exit 1
fi

# sddm
if pkg_installed sddm; then

  echo -e "\033[0;32m[DISPLAYMANAGER]\033[0m detected // sddm"
  if [ ! -d /etc/sddm.conf.d ]; then
    sudo mkdir -p /etc/sddm.conf.d
  fi

  if [ ! -f /etc/sddm.conf.d/kde_settings.t2.bkp ]; then
    echo -e "\033[0;32m[DISPLAYMANAGER]\033[0m configuring sddm..."
    echo -e "Select sddm theme:\n[1] Candy\n[2] Corners"
    read -p " :: Enter option number : " sddmopt

    case $sddmopt in
    1) sddmtheme="Candy" ;;
    *) sddmtheme="Corners" ;;
    esac

    sudo tar -xzf ${cloneDir}/Source/arcs/Sddm_${sddmtheme}.tar.gz -C /usr/share/sddm/themes/
    sudo touch /etc/sddm.conf.d/kde_settings.conf
    sudo cp /etc/sddm.conf.d/kde_settings.conf /etc/sddm.conf.d/kde_settings.t2.bkp
    sudo cp /usr/share/sddm/themes/${sddmtheme}/kde_settings.conf /etc/sddm.conf.d/
  else
    echo -e "\033[0;33m[SKIP]\033[0m sddm is already configured..."
  fi

  if [ ! -f /usr/share/sddm/faces/${USER}.face.icon ] && [ -f ${cloneDir}/Source/misc/${USER}.face.icon ]; then
    sudo cp ${cloneDir}/Source/misc/${USER}.face.icon /usr/share/sddm/faces/
    echo -e "\033[0;32m[DISPLAYMANAGER]\033[0m avatar set for ${USER}..."
  fi

else
  echo -e "\033[0;33m[WARNING]\033[0m sddm is not installed..."
fi

# dolphin
if pkg_installed dolphin && pkg_installed xdg-utils; then

  echo -e "\033[0;32m[FILEMANAGER]\033[0m detected // dolphin"
  xdg-mime default org.kde.dolphin.desktop inode/directory
  echo -e "\033[0;32m[FILEMANAGER]\033[0m setting" $(xdg-mime query default "inode/directory") "as default file explorer..."

else
  echo -e "\033[0;33m[WARNING]\033[0m dolphin is not installed..."
fi

# shell
"${scrDir}/restore_shl.sh"

# flatpak
if ! pkg_installed flatpak; then

  echo -e "\033[0;32m[FLATPAK]\033[0m flatpak application list..."
  awk -F '#' '$1 != "" {print "["++count"]", $1}' "${scrDir}/.extra/custom_flat.lst"
  prompt_timer 60 "Install these flatpaks? [Y/n]"
  fpkopt=${promptIn,,}

  if [ "${fpkopt}" = "y" ]; then
    echo -e "\033[0;32m[FLATPAK]\033[0m intalling flatpaks..."
    "${scrDir}/.extra/install_fpk.sh"
  else
    echo -e "\033[0;33m[SKIP]\033[0m intalling flatpaks..."
  fi

else
  echo -e "\033[0;33m[SKIP]\033[0m flatpak is already installed..."
fi

# ┌──────────────────────────────────────────────────────────┐
#
#                       Added by Gl00ria
#
# └──────────────────────────────────────────────────────────┘

# TLP
echo -e "\033[0;33m[COPY]\033[0m (Configs/etc/tlp.conf) \033[0;33m-->\033[0m (/etc/)"
sudo cp "../Configs/etc/tlp.conf" /etc/
# echo "\033[0;33m[MASK]\033[0m \033[0;33m-->\033[0m (rfkill "service & socket" & power-profiles-daemon) for TLP"
# sudo systemctl mask systemd-rfkill.service
# sudo systemctl mask systemd-rfkill.socket
# sudo systemctl mask power-profiles-daemon.service

# Auto-cpufreq
echo -e "\033[0;33m[COPY]\033[0m (Configs/etc/auto-cpufreq.conf) \033[0;33m-->\033[0m (/etc/)"
sudo cp "../Configs/etc/auto-cpufreq.conf" /etc/

# Grub-btrfsd
echo -e "\033[0;33m[COPY]\033[0m (Configs/etc/systemd/system/grub-btrfsd.service) \033[0;33m-->\033[0m (/etc/systemd/system/)"
sudo cp "../Configs/etc/systemd/system/grub-btrfsd.service" /etc/systemd/system/

# Apparmor
echo -e "\033[0;33m[ADD]\033[0m (Apparmor modules) \033[0;33m-->\033[0m (/etc/default/grub)"
sudo sed -i "/^GRUB_CMDLINE_LINUX=/c\GRUB_CMDLINE_LINUX='lsm=landlock,lockdown,yama,apparmor,bqf'" /etc/default/grub
echo -e "\033[0;33m[REGENERATE]\033[0m (GRUB) \033[0;33m-->\033[0m (After adding 'Aapparmor modules')"
sudo grub-mkconfig -o /boot/grub/grub.cfg

# TPM (tmux plugin manager)
echo -e "\033[0;33m[CLONE]\033[0m (Tmux Plugin Manager) \033[0;33m-->\033[0m (~/.tmux/plugins/)"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# My personal nvim config
echo -e "\033[0;33m[CLONE]\033[0m (My Neovim config) \033[0;33m-->\033[0m (~/.config/)"
git clone https://github.com/Gl00ria/nvim.git ~/.config/nvim

# copy extra vars to /etc/sudoers.d/
echo -e "\033[0;33m[COPY]\033[0m (Extra Env Vars) \033[0;33m-->\033[0m (/etc/sudoers.d/)"
sudo cp "../Configs/etc/sudoers.d/custom_env" /etc/sudoers.d/
