#!/usr/bin/env bash
#|---/ /+--------------------------------------+---/ /|#
#|--/ /-| Script to apply post install configs |--/ /-|#
#|-/ /--| Prasanth Rangan                      |-/ /--|#
#|/ /---+--------------------------------------+/ /---|#
# ┌                                                          ┐
# │                                                          │
# │                    Edited by @Gl00ria                    │
# │                                                          │
# └                                                          ┘

scrDir=$(dirname "$(realpath "$0")")
source "${scrDir}/global_fn.sh"
if [ $? -ne 0 ]; then
  echo "Error: unable to source global_fn.sh..."
  exit 1
fi

# sddm
# if pkg_installed sddm; then

#   echo -e "\033[0;32m[DISPLAYMANAGER]\033[0m detected // sddm"
#   if [ ! -d /etc/sddm.conf.d ]; then
#     sudo mkdir -p /etc/sddm.conf.d
#   fi

#   if [ ! -f /etc/sddm.conf.d/kde_settings.t2.bkp ]; then
#     echo -e "\033[0;32m[DISPLAYMANAGER]\033[0m configuring sddm..."
#     echo -e "Select sddm theme:\n[1] Candy\n[2] Corners"
#     read -p " :: Enter option number : " sddmopt

#     case $sddmopt in
#     1) sddmtheme="Candy" ;;
#     *) sddmtheme="Corners" ;;
#     esac

#     sudo tar -xzf ${cloneDir}/Source/arcs/Sddm_${sddmtheme}.tar.gz -C /usr/share/sddm/themes/
#     sudo touch /etc/sddm.conf.d/kde_settings.conf
#     sudo cp /etc/sddm.conf.d/kde_settings.conf /etc/sddm.conf.d/kde_settings.t2.bkp
#     sudo cp /usr/share/sddm/themes/${sddmtheme}/kde_settings.conf /etc/sddm.conf.d/
#   else
#     echo -e "\033[0;33m[SKIP]\033[0m \033[0;33m-->\033[0m sddm is already configured..."
#   fi

#   if [ ! -f /usr/share/sddm/faces/${USER}.face.icon ] && [ -f ${cloneDir}/Source/misc/${USER}.face.icon ]; then
#     sudo cp ${cloneDir}/Source/misc/${USER}.face.icon /usr/share/sddm/faces/
#     echo -e "\033[0;32m[DISPLAYMANAGER]\033[0m avatar set for ${USER}..."
#   fi

# else
#   echo -e "\033[0;33m[WARNING]\033[0m sddm is not installed..."
# fi

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

# SwayOSD
if pacman -Qi ufw &>/dev/null; then
  echo -e "\033[0;33m[ENABLE]\033[0m (swayosd-libinput-backend.service)"
  sudo systemctl enable swayosd-libinput-backend.service
else
  echo -e '\033[0;33m[SwayOSD]\033[0m is not installed, no worries. Its extra personal ' >&2
fi

# Firewall (Uncompleted Friewall 'ufw')
if pacman -Qi ufw &>/dev/null; then
  echo -e "\033[0;33m[ENABLE]\033[0m (ufw.service)"
  sudo systemctl enable ufw.service
  echo -e "\033[0;33m[SETTING-UP]\033[0m (UFW)"
  sudo ufw default deny # deny all
  # sudo ufw allow from 192.168.0.0/24
  sudo ufw allow Deluge
  sudo ufw limit ssh # limit ssh
  sudo ufw enable
else
  echo -e '\033[0;33m[UFW]\033[0m is not installed, no worries. Its extra personal ' >&2
fi

# TLP
if pacman -Qi tlp &>/dev/null; then
  echo -e "\033[0;33m[COPY]\033[0m (Configs/etc/tlp.conf) \033[0;33m-->\033[0m (/etc/)"
  sudo cp "../Configs/etc/tlp.conf" /etc/
  echo -e "\033[0;33m[ENABLE]\033[0m (tlp.service)"
  sudo systemctl enable tlp.service
else
  echo -e '\033[0;33m[TLP]\033[0m is not installed, no worries. Its extra personal ' >&2
fi

# Auto-cpufreq
if pacman -Qi auto-cpufreq &>/dev/null; then
  echo -e "\033[0;33m[COPY]\033[0m (Configs/etc/auto-cpufreq.conf) \033[0;33m-->\033[0m (/etc/)"
  sudo cp "../Configs/etc/auto-cpufreq.conf" /etc/
  echo -e "\033[0;33m[ENABLE]\033[0m (auto-cpufreq.service)"
  sudo systemctl enable auto-cpufreq.service
  sudo systemctl start auto-cpufreq.service
else
  echo -e '\033[0;33m[AUTO-CPUFREQ]\033[0m is not installed, no worries. Its extra personal' >&2
fi

# Grub-btrfsd
if pacman -Qi grub-btrfs &>/dev/null; then
  echo -e "\033[0;33m[COPY]\033[0m (Configs/etc/systemd/system/grub-btrfsd.service) \033[0;33m-->\033[0m (/etc/systemd/system/)"
  sudo cp "../Configs/etc/systemd/system/grub-btrfsd.service" /etc/systemd/system/
else
  echo -e '\033[0;33m[GRUB-BTRFSD]\033[0m is not installed, no worries. Its extra personal' >&2
fi

# Apparmor
# https://wiki.archlinux.org/title/AppArmor
if pacman -Qi apparmor &>/dev/null; then
  echo -e "\033[0;33m[ADD]\033[0m (Apparmor modules) \033[0;33m-->\033[0m (/etc/default/grub)"
  sudo sed -i "/^GRUB_CMDLINE_LINUX=/c\GRUB_CMDLINE_LINUX='lsm=landlock,lockdown,yama,apparmor,bqf'" /etc/default/grub
  echo -e "\033[0;33m[ADD ${USER}]\033[0m to \033[0;33m-->\033[0m (Audit Group) for 'APPARMOR'"
  sudo groupadd -r audit
  sudo gpasswd -a $USER audit
  echo -e "\033[0;33m[CHANGE LOG_GROUP FROM ROOT TO 'AUDIT']\033[0m \033[0;33m-->\033[0m (in auditd.conf)"
  sudo sed -i "/^log_group = root/c\log_group = audit" /etc/audit/auditd.conf
  echo -e "\033[0;33m[REGENERATE]\033[0m (GRUB) \033[0;33m-->\033[0m (After adding 'Aapparmor modules')"
  echo -e "\033[0;33m[ENABLE]\033[0m (apparmor.service)"
  sudo systemctl enable apparmor.service
  sudo grub-mkconfig -o /boot/grub/grub.cfg
else
  echo -e '\033[0;33m[APPARMOR]\033[0m is not installed, no worries. Its extra personal' >&2
fi

# TPM (tmux plugin manager)
if [[ ! -d ~/.tmux/plugins/tpm/ ]]; then
  echo -e "\033[0;33m[CLONE]\033[0m (Tmux Plugin Manager) \033[0;33m-->\033[0m (~/.tmux/plugins/)"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# My personal nvim config
if [[ -d ~/.config/nvim/ ]]; then
  echo -e "\033[0;33m[BACKING UP]\033[0m (Current Neovim config) \033[0;33m-->\033[0m (~/.config/cfg_backups/nvim_$(date +'%H:%M:%S_%d-%m-%Y'))"
  mv ~/.config/nvim/ ~/.config/cfg_backups/nvim_$(date +'%H:%M:%S_%d-%m-%Y')
  echo -e "\033[0;33m[CLONE]\033[0m (My Neovim config) \033[0;33m-->\033[0m (~/.config/)"
  git clone https://github.com/Gl00ria/nvim.git ~/.config/nvim
else
  echo -e "\033[0;33m[CLONE]\033[0m (My Neovim config) \033[0;33m-->\033[0m (~/.config/nvim)"
  git clone https://github.com/Gl00ria/nvim.git ~/.config/nvim
fi

if [[ -d ~/Pictures/wallpapers/ ]]; then
  echo -e "\033[0;33m[BACKING UP]\033[0m (Current wallpapers) \033[0;33m-->\033[0m (~/.config/cfg_backups/wallpapers_$(date +'%H:%M:%S_%d-%m-%Y'))"
  mv ~/Pictures/wallpapers/ ~/.config/cfg_backups/wallpapers_$(date +'%H:%M:%S_%d-%m-%Y')
  echo -e "\033[0;33m[CLONE]\033[0m (My Wallpapers) \033[0;33m-->\033[0m (~/Pictures/wallpapers/)"
  git clone https://github.com/Gl00ria/wallpapers.git ~/Pictures/
else
  echo -e "\033[0;33m[CLONE]\033[0m (My Wallpapers) \033[0;33m-->\033[0m (~/Pictures/wallpapers/)"
  git clone https://github.com/Gl00ria/wallpapers.git ~/Pictures/
fi

# copy extra vars to /etc/sudoers.d/
echo -e "\033[0;33m[COPY]\033[0m (Extra Env Vars) \033[0;33m-->\033[0m (/etc/sudoers.d/)"
sudo cp "../Configs/etc/sudoers.d/custom_env" /etc/sudoers.d/

# SDDM theme (https://github.com/Keyitdev/sddm-astronaut-theme)
echo -e "\033[0;33m[SETTING-UP]\033[0m \033[0;33m(SDDM-THEME) \033[0m"
sudo git clone https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme
sudo cp /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf
