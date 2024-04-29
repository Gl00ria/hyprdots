###### _<div align="right"><sub>// design by t2</sub></div>_

<div align="center">

![hyde_banner](https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/hyde_banner.png)

<br>

<a href="#installation"><kbd> <br> Installation <br> </kbd></a>&ensp;&ensp;
<a href="#themes"><kbd> <br> Themes <br> </kbd></a>&ensp;&ensp;
<a href="#styles"><kbd> <br> Styles <br> </kbd></a>&ensp;&ensp;
<a href="#keybindings"><kbd> <br> Keybindings <br> </kbd></a>&ensp;&ensp;
<a href="https://www.youtube.com/watch?v=2rWqdKU1vu8&list=PLt8rU_ebLsc5yEHUVsAQTqokIBMtx3RFY&index=1"><kbd> <br> Youtube <br> </kbd></a>&ensp;&ensp;
<a href="https://github.com/prasanthrangan/hyprdots/wiki"><kbd> <br> Wiki <br> </kbd></a>&ensp;&ensp;
<a href="https://discord.gg/qWehcFJxPa"><kbd> <br> Discord <br> </kbd></a>

</div><br><br>

https://github.com/prasanthrangan/hyprdots/assets/106020512/7f8fadc8-e293-4482-a851-e9c6464f5265

<br><div align="center"><img width="12%" src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/arch.png"/><br></div>

## Installation

The installation script is designed for a minimal [Arch Linux](https://wiki.archlinux.org/title/Arch_Linux) and [EndeavourOS](https://github.com/endeavouros-team) install, but **may** work on some [Arch-based distros](https://wiki.archlinux.org/title/Arch-based_distributions).
While installing HyDE alongside another [DE](https://wiki.archlinux.org/title/Desktop_environment)/[WM](https://wiki.archlinux.org/title/Window_manager) should work, due to it being a heavily customized setup, it **will** conflict with your [GTK](https://wiki.archlinux.org/title/GTK)/[Qt](https://wiki.archlinux.org/title/Qt) theming, [Shell](https://wiki.archlinux.org/title/Command-line_shell), [SDDM](https://wiki.archlinux.org/title/SDDM), [GRUB](https://wiki.archlinux.org/title/GRUB), etc. and is at your own risk.

> [!IMPORTANT]
> The install script will auto-detect an NVIDIA card and install nvidia-dkms drivers for your kernel.
> Please ensure that your NVIDIA card supports dkms drivers in the list provided [here](https://wiki.archlinux.org/title/NVIDIA).

> [!CAUTION]
> The script modifies your `grub` or `systemd-boot` config to enable NVIDIA DRM.

To install, execute the following commands:

```shell
pacman -Sy git
git clone --depth 1 https://github.com/Gl00ria/hyprdots ~/HyDE
cd ~/HyDE/Scripts
./install.sh
```

> [!TIP]
> You can also add any other apps you wish to install alongside HyDE to `Scripts/custom_apps.lst` and pass the file as a parameter to install it like so:
>
> ```shell
> ./install.sh custom_apps.lst
> ```

As a second install option, you can also use `Hyde-install`, which might be easier for some.
View installation instructions for HyDE in [Hyde-cli - Usage](https://github.com/kRHYME7/Hyde-cli?tab=readme-ov-file#usage).

Please reboot after the install script completes and takes you to the SDDM login screen (or black screen) for the first time.
For more details, please refer to the [installation wiki](https://github.com/prasanthrangan/hyprdots/wiki/Installation).

### Updating

To update HyDE, you will need to pull the latest changes from GitHub and restore the configs by running the following commands:

```shell
cd ~/HyDE/Scripts
git pull
./install.sh -r
```

> [!IMPORTANT]
> Please note that any configurations you made will be overwritten if listed to be done so as listed by `Scripts/restore_cfg.lst`.
> However, all replaced configs are backed up and may be recovered from in `~/.config/cfg_backups`.

As a second update option, you can use `Hyde restore ...`, which does have a better way of managing restore and backup options.
For more details, you can refer to [Hyde-cli - dots management wiki](https://github.com/kRHYME7/Hyde-cli/wiki/Dots-Management).

<div align="right">
  <br>
  <a href="#-design-by-t2"><kbd> <br> 🡅 <br> </kbd></a>
</div>

## Themes

All our official themes are stored in a separate repository, allowing users to install them using themepatcher.
For more information, visit [prasanthrangan/hyde-themes](https://github.com/prasanthrangan/hyde-themes).

<div align="center">
  <table><tr><td>

[![Catppuccin-Latte](https://placehold.co/130x30/dd7878/eff1f5?text=Catppuccin-Latte&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Catppuccin-Latte)
[![Catppuccin-Mocha](https://placehold.co/130x30/b4befe/11111b?text=Catppuccin-Mocha&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Catppuccin-Mocha)
[![Decay-Green](https://placehold.co/130x30/90ceaa/151720?text=Decay-Green&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Decay-Green)
[![Edge-Runner](https://placehold.co/130x30/fada16/000000?text=Edge-Runner&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Edge-Runner)
[![Frosted-Glass](https://placehold.co/130x30/7ed6ff/1e4c84?text=Frosted-Glass&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Frosted-Glass)
[![Graphite-Mono](https://placehold.co/130x30/a6a6a6/262626?text=Graphite-Mono&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Graphite-Mono)
[![Gruvbox-Retro](https://placehold.co/130x30/475437/B5CC97?text=Gruvbox-Retro&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Gruvbox-Retro)
[![Material-Sakura](https://placehold.co/130x30/f2e9e1/b4637a?text=Material-Sakura&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Material-Sakura)
[![Nordic-Blue](https://placehold.co/130x30/D9D9D9/476A84?text=Nordic-Blue&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Nordic-Blue)
[![Rosé-Pine](https://placehold.co/130x30/c4a7e7/191724?text=Rosé-Pine&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Rose-Pine)
[![Synth-Wave](https://placehold.co/130x30/495495/ff7edb?text=Synth-Wave&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Synth-Wave)
[![Tokyo-Night](https://placehold.co/130x30/7aa2f7/24283b?text=Tokyo-Night&font=Oswald)](https://github.com/prasanthrangan/hyde-themes/tree/Tokyo-Night)

  </td></tr></table>
</div>

> [!TIP]
> Everyone, including you can create, maintain, and share additional themes, all of which can be installed using themepatcher!
> To create your own custom theme, please refer to the [theming wiki](https://github.com/prasanthrangan/hyprdots/wiki/Theming).
> If you wish to have your hyde theme showcased, or you want to find some non-official themes, visit [kRHYME7/hyde-gallery](https://github.com/kRHYME7/hyde-gallery)!

<div align="right">
  <br>
  <a href="#-design-by-t2"><kbd> <br> 🡅 <br> </kbd></a>
</div>

## Styles

<div align="center"><table><tr>Theme Select</tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/theme_select_1.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/theme_select_2.png"/></td></tr></table></div>

<div align="center"><table><tr><td>Wallpaper Select</td><td>Launcher Select</td></tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/walls_select.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_sel.png"/></td></tr>
<tr><td>Wallbash Modes</td><td>Notification Action</td></tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/wb_mode_sel.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/notif_action_sel.png"/></td></tr>
</table></div>

<div align="center"><table><tr>Rofi Launcher</tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_1.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_2.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_3.png"/></td></tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_4.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_5.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_6.png"/></td></tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_7.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_8.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_9.png"/></td></tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_10.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_11.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/rofi_style_12.png"/></td></tr>
</table></div>

<div align="center"><table><tr>Wlogout Menu</tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/wlog_style_1.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/wlog_style_2.png"/></td></tr></table></div>

<div align="center"><table><tr>Game Launcher</tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/game_launch_1.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/game_launch_2.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/game_launch_3.png"/></td></tr></table></div>
<div align="center"><table><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/game_launch_4.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/game_launch_5.png"/></td></tr></table></div>

<div align="right">
  <br>
  <a href="#-design-by-t2"><kbd> <br> 🡅 <br> </kbd></a>
</div>

# _Gl00ria's Remix..._

## Keybindings

**NOTES:**

- I have a split keyboard.... So the workflow may not be comfortable to you. I also use the [keybind_hints script](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/hypr/scripts/keybind_hints.sh) to display other app's keybinds.

- The keys related to "Hyprland" are executable, which means you can run (Super + H), choose what want, then hit enter to execute the command.
- In case you want to edit the keymaps these are the files to be edited ([keybind_hints script](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/hypr/scripts/keybind_hints.sh), [08_key_apps_utils.conf](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/hypr/source/08_key_apps_utils.conf), [08_keys_media.conf](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/hypr/source/08_keys_media.conf), [08_keys_windows.conf](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/hypr/source/08_keys_windows.conf))
<div align="center">

| Keys                                                  | Action                               |
| :---------------------------------------------------- | :----------------------------------- |
| <kbd>Super</kbd> + <kbd>H</kbd><br>                   | Keybind Hint                         |
| <kbd>Super</kbd> + <kbd>Del</kbd>                     | Kill Hyprland session                |
| <kbd>Super</kbd> + <kbd>K</kbd>                       | Kitty                                |
| <kbd>Super</kbd> + <kbd>F</kbd>                       | Firefox                              |
| <kbd>Super</kbd> + <kbd>E</kbd>                       | Dolphin                              |
| <kbd>ALT</kbd> + <kbd>Space</kbd>                     | App Launcher                         |
| <kbd>Super</kbd> + <kbd>L</kbd>                       | Lock Screen                          |
| ----------------------------------------------------- | ------------------------------------ |
| UTILS                                                 |                                      |
| ----------------------------------------------------- | ------------------------------------ |
| <kbd>Super</kbd> + <kbd>Tab</kbd>                     | List Oppened Apps                    |
| <kbd>Super</kbd> + <kbd>R</kbd>                       | Browse File System                   |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>V</kbd>    | Open Clipboard                       |
| <kbd>Super</kbd> + <kbd>M</kbd>                       | Music Player (Rhythmbox)             |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Del</kbd>     | Open Btop                            |
| <kbd>Print</kbd>                                      | Screenshot (Current Monitor)         |
| <kbd>Shift</kbd> + <kbd>Print</kbd>                   | Screenshot (Select Region)           |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Print</kbd>   | Screenshot (All Monitors)            |
| <kbd>Shit</kbd> + <kbd>Alt</kbd> + <kbd>G</kbd>       | Game Mode, Disable Hypr Effexts      |
| <kbd>Shit</kbd> + <kbd>Alt</kbd> + <kbd>T</kbd>       | Change Keyboard Layout               |
| <kbd>XF86AudioMute</kbd>                              | Toggle Mute (Speaker)                |
| <kbd>XF86AudioMicMute</kbd>                           | Toggle Mute (Mic)                    |
| <kbd>XF86AudioLowerVolume</kbd>                       | Decrease Volume (Knob, in my case)   |
| <kbd>XF86AudioRaiseVolume</kbd>                       | Increase Volume (Knob, in my case)   |
| <kbd>XF86AudioPlay</kbd>                              | Play (Knob, in my case)              |
| <kbd>XF86AudioPause</kbd>                             | Pause (Knob, in my case)             |
| <kbd>XF86AudioNext</kbd>                              | Play-Next (Knob, in my case)         |
| <kbd>XF86AudioPrev</kbd>                              | Play-Prev (Knob, in my case)         |
| <kbd>XF86MonBrightnessUp</kbd>                        | Brightness UP (Knob, in my case)     |
| <kbd>XF86MonBrightnessDown</kbd>                      | Brightness Down (Knob, in my case)   |
| ----------------------------------------------------- | ------------------------------------ |
| EYE-CANDY                                             |                                      |
| ----------------------------------------------------- | ------------------------------------ |
| <kbd>Super</kbd> + <kbd>W</kbd>                       | Toggle Waybar                        |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>T</kbd>    | Select Theme                         |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>B</kbd>    | Toggle Wallbash Mode                 |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>M</kbd>    | Change Rofi's style                  |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd>    | Select Wallpaper                     |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd>    | Random Wallpaper                     |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>N</kbd>    | Next Wallpaper                       |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>    | Prev Wallpaper                       |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>↑</kbd>      | Next Waybar Mode                     |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>↓</kbd>      | Prev Waybar Mode                     |
| <kbd>Shift</kbd> + <kbd>Alt</kbd> + <kbd>1</kbd>      | Toggle Shader (BlueFilter)           |
| <kbd>Shift</kbd> + <kbd>Alt</kbd> + <kbd>2</kbd>      | Toggle Shader (ExtraDark)            |
| ----------------------------------------------------- | ------------------------------------ |
| WINDOWS                                               |                                      |
| ----------------------------------------------------- | ------------------------------------ |
| <kbd>Alt</kbd> + <kbd>Q</kbd>                         | Kill Active Window                   |
| <kbd>Alt</kbd> + <kbd>Enter</kbd>                     | Fullscreen(Keeps waybar)             |
| <kbd>Super</kbd> + <kbd>Ctlr</kbd> + <kbd>F</kbd>     | Fullscreen(Hides waybar)             |
| <kbd>Super</kbd> + <kbd>S</kbd>                       | Toggle Scratchpad                    |
| <kbd>Super</kbd> + <kbd>Ctlr</kbd> + <kbd>P</kbd>     | Toggle Pseudo                        |
| <kbd>Super</kbd> + <kbd>Ctlr</kbd> + <kbd>S</kbd>     | Toggle Split                         |
| <kbd>Super</kbd> + <kbd>P</kbd>                       | Toggle Floating                      |
| <kbd>Super</kbd> + <kbd>Ctlr</kbd> + <kbd>G</kbd>     | Toggle Group                         |
| <kbd>Alt</kbd> + <kbd>Tab</kbd>                       | Cycle Focus                          |
| <kbd>Super</kbd> + <kbd>Ctlr</kbd> + <kbd>C</kbd>     | Center Window                        |
| <kbd>Alt</kbd> + <kbd>Tab</kbd>                       | Cycle Focus                          |
| <kbd>Alt</kbd> + <kbd>Y</kbd>                         | Move Window LEFT                     |
| <kbd>Alt</kbd> + <kbd>O</kbd>                         | Move Window RIGHT                    |
| <kbd>Alt</kbd> + <kbd>I</kbd>                         | Move Window UP                       |
| <kbd>Alt</kbd> + <kbd>U</kbd>                         | Move Window DOWN                     |
| <kbd>Alt</kbd> + <kbd>K</kbd>                         | Move Focus UP                        |
| <kbd>Alt</kbd> + <kbd>J</kbd>                         | Move Focus DOWN                      |
| <kbd>Alt</kbd> + <kbd>H</kbd>                         | Move Focus LEFT                      |
| <kbd>Alt</kbd> + <kbd>L</kbd>                         | Move Focus RIGHT                     |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>←</kbd>    | Resize Window                        |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>→</kbd>    | Resize Window                        |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>↑</kbd>    | Resize Window                        |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>↓</kbd>    | Resize Window                        |
| <kbd>Alt</kbd> + <kbd>1</kbd>                         | 1st Wrokspace                        |
| <kbd>Alt</kbd> + <kbd>2</kbd>                         | 2nd Wrokspace                        |
| <kbd>Alt</kbd> + <kbd>3</kbd>                         | 3rd Wrokspace                        |
| <kbd>Alt</kbd> + <kbd>4</kbd>                         | 4th Wrokspace                        |
| <kbd>Alt</kbd> + <kbd>5</kbd>                         | 5th Wrokspace                        |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>1</kbd>       | Window To 1st Workspace              |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>2</kbd>       | Window To 2nd Workspace              |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>3</kbd>       | Window To 3rd Workspace              |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>4</kbd>       | Window To 4th Workspace              |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>5</kbd>       | Window To 5th Workspace              |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>6</kbd>       | Window To 6th Workspace              |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>7</kbd>       | Window To 7th Workspace              |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>8</kbd>       | Window To 8th Workspace              |
| <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>9</kbd>       | Window To 9th Workspace              |

</div>

## Grub themes: 'With Credits to them authors'

- Theme 1-5: by [MrVivekRajan](https://github.com/MrVivekRajan/Grub-Themes)
- Theme 6 & 7: by [ChrisTitusTech](https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes)
- Theme 8: by [PROxZIMA](https://github.com/PROxZIMA/boo-grub)
- Theme 9: by [harishnkr](https://github.com/harishnkr/bsol)

## Custom Apps:

While this is rice is related to [Hyprland](https://hyprland.org/) only, but I also use it to install and configure my system in case of a new installation. Please see [custom_hypr](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/custom_hypr.lst) for the core apps & [custom_apps](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/custom_apps.lst) for apps I rarely use but placed there for future reference.

## Core changes:

1. Installation Scripts:

   - [install.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/install.sh):
     - Banner
     - Colors
   - [install_pkg.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/install_pkg.sh):
     - Colors
   - [install_pre.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/install_pre.sh):
     - Colors
     - Extra GRUB themes
     - set `GRUB_SAVEDEFAULT` to false since I use 'BTRFS' & grub cannot write on btrfs.
   - [install_pst.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/install_pst.sh):
     - Colors
     - [TLP](https://archlinux.org/packages/extra/any/tlp/) config
     - [Auto-cpufreq](https://aur.archlinux.org/packages/auto-cpufreq) config
     - [Grub-btrfs](https://github.com/Antynea/grub-btrfs) config
     - [Apparmor](https://gitlab.com/apparmor/apparmor) config
     - Install [TPM 'Tmux Plugin Manager'](https://github.com/tmux-plugins/tpm)
     - Clone my [nvim config](https://github.com/Gl00ria/nvim)
     - Clone my [Wallpapers](https://github.com/Gl00ria/wallpapers)
     - Add extra variables to `/etc/sudoers.d/`
   - [restore_cfg.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/restore_cfg.sh):
     - Date fromat
   - [restore_fnt.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/restore_fnt.sh):
     - Colors
   - [restore_shl.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/restore_shl.sh):
     - Colors
     - Disable zsh plugin installation
   - [system_ctl.lst](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/system_ctl.lst):
     - Added:
       - [ UFW ](https://archlinux.org/packages/extra/any/ufw/) service
       - [Apparmor](https://gitlab.com/apparmor/apparmor) service
       - [TLP](https://archlinux.org/packages/extra/any/tlp/) config
       - [Auto-cpufreq](https://aur.archlinux.org/packages/auto-cpufreq) service
       - [SwayOSD](https://github.com/ErikReider/SwayOSD) backend service
   - [install_mod](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/.extra/install_mod.sh): since [EndeavourOS](https://github.com/endeavouros-team) uses [Dracut](https://github.com/dracut-ng/dracut-ng) for the "initramfs" the script's edited to work with both ([Dracut](https://github.com/dracut-ng/dracut-ng) & [ mkinitcopio ](https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio) in case of vanilla Arch)

2. [Hyprland](https://hyprland.org/):

   - Keybinds: as mentioned above.
   - No exec-once, just an [autostart.sh](https://github.com/Gl00ria/hyprdots/blob/e534bb67c8550be0db68ac5aaa4a506bf0043f0b/Configs/.config/hypr/scripts/autostart.sh)
   - Moved scripts from `~/.local/share/bin/ to ~/.config/hypr/scripts/`.
   - Placed the files to be sourced by Hyprland into `~/.config/hypr/source/`.
   - Added [Hyprlock](https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/) as the lockscreen & removed [Swaylock](https://github.com/mortie/swaylock-effects), see [hyprlock.conf](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/hypr/hyprlock.conf).
   - Added [Hypridle](https://wiki.hyprland.org/Hypr-Ecosystem/hypridle/), see [hypridle.conf](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/hypr/hypridle.conf).
     - Notify User after 10min of inactivity.
     - Set Laptop's brightness to %10 after 15min of inactivity & restore when active.
     - Set HDMI-1's brightness to %10 after 15min of inactivity & restore to %60 when active.
     - Hibernate after 20min of inactivity.
   - Added [Hyprshade](https://github.com/loqusion/hyprshade) with 5 shaders, see [shaders](https://github.com/Gl00ria/hyprdots/tree/gl00ria_remix/Configs/.config/hypr/shaders)
   - Random Wallpaper every 15min, see [swwwrandom.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/hypr/scripts/swwwrandomwall.sh) & the [autostart.sh](https://github.com/Gl00ria/hyprdots/blob/e534bb67c8550be0db68ac5aaa4a506bf0043f0b/Configs/.config/hypr/scripts/autostart.sh#L65).

     - Controlled via a [keybind](https://github.com/Gl00ria/hyprdots/blob/e534bb67c8550be0db68ac5aaa4a506bf0043f0b/Configs/.config/hypr/source/08_key_apps_utils.conf#L104) or [waybar](https://github.com/Gl00ria/hyprdots/blob/e534bb67c8550be0db68ac5aaa4a506bf0043f0b/Configs/.config/waybar/modules/backlight.jsonc#L8).

3. [Waybar](https://github.com/Alexays/Waybar):

   - Changed Font to [CascadiaCode](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode).
   - Edited the [backlight module](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/waybar/modules/backlight.jsonc) to control shaders & to control brightness via [SwayOSD](https://github.com/ErikReider/SwayOSD).
   - Edited the [battery module](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/waybar/modules/battery.jsonc) to control external monitor's brightness 'HDMI-1' in my case.
   - Edited the [pulseaudio module](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/waybar/modules/pulseaudio.jsonc) to control volume via [SwayOSD](https://github.com/ErikReider/SwayOSD).
   - Edited the [wallchange module](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/waybar/modules/wallchange.jsonc) to select random image.
   - Added more vars to the [window module](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/waybar/modules/window.jsonc).
   - Added [Disk module](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/waybar/modules/disk.jsonc).

4. [Dunst](https://github.com/dunst-project/dunst):

   - Changed notification location to 'bottom right'.
   - Changed Font to [VictorMono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/VictorMono).

5. Added [SwayOSD](https://github.com/ErikReider/SwayOSD) as GTK based on screen display for keyboard shortcuts like caps-lock and volume.
6. Added [Neovim](https://github.com/neovim/neovim) with my custom config:
   - [Config Repo](https://github.com/Gl00ria/nvim)
   - [see install_pst.sh](https://github.com/Gl00ria/hyprdots/blob/e534bb67c8550be0db68ac5aaa4a506bf0043f0b/Scripts/install_pst.sh#L134) if you don't want my config.
7. Fonts: [see custom_hypr](https://github.com/Gl00ria/hyprdots/blob/e534bb67c8550be0db68ac5aaa4a506bf0043f0b/Scripts/custom_hypr.lst#L220)

   - Added:

     - [ Victormono NF ](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/VictorMono)
     - [Adobe Srouce Code Pro](https://adobe-fonts.github.io/source-code-pro/)
     - [Gsfonts](https://github.com/ArtifexSoftware/urw-base35-fonts)
     - [Liberation](https://archlinux.org/packages/extra/any/ttf-liberation/)
     - [Opensans](https://fonts.google.com/specimen/Open+Sans)
     - [Noto fonts](https://fonts.google.com/noto)
     - [ Noto fonts emoji ](https://www.google.com/get/noto/)
     - [ Noto fonts Extra ](https://www.google.com/get/noto/)
     - [ Xorg fonts Encodings ](https://gitlab.freedesktop.org/xorg/font/encodings)

   - Removed:
     - JetBrains NF
     - Mononoki NF

8. Wallpapers:
   **NOTE** Hyde's wallpapers are still exists and controlled as usual, this just for random wallpapers.
   - [Wallpapers Repo](https://github.com/Gl00ria/wallpapers).
   - [see install_pst.sh](https://github.com/Gl00ria/hyprdots/blob/e534bb67c8550be0db68ac5aaa4a506bf0043f0b/Scripts/install_pst.sh#L134) if you don't want my stolen wallpapers.
9. Kitty terminal:
   - Changed font to VictorMono NF Bold
   - Make custom Tokyonight theme persistent rather than changing it when selecting another HyDE theme. See [kitty.conf](https://github.com/Gl00ria/hyprdots/blob/e534bb67c8550be0db68ac5aaa4a506bf0043f0b/Configs/.config/kitty/kitty.conf#L224).
10. Shells:

    - Zsh:
      - [.zshrc file](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.zshrc) to source [zshrc folder](https://github.com/Gl00ria/hyprdots/tree/gl00ria_remix/Configs/.config/zshrc) in `~/.config`
      - [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh) with plugins, see [zshrc/03_plugins.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/zshrc/03_plugins.sh)
      - Custom [ starship ](https://starship.rs/) prompt
      - [ Fastfetch ](https://github.com/fastfetch-cli/fastfetch) with ArchLinux Logo, BUT I have EndeavourOS... Who cares!
      - [ FZF ](https://github.com/junegunn/fzf) with custom preview & functions. See [zshrc/07_fzf.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/zshrc/07_fzf.sh).
      - [Bat](https://github.com/sharkdp/bat), as a preview with FZF with Tokyo-Night theme
      - Added [trash-cli](https://github.com/andreafrancia/trash-cli) as a safe `rm` command alternative, see [custom_hypr.lst](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/custom_hypr.lst), [zshrc/09_others.sh](https://github.com/Gl00ria/hyprdots/blob/67b351bd52fe155d79fd581217d59816f102d2c0/Configs/.config/zshrc/09_other.sh#L32) & and [bashrc](https://github.com/Gl00ria/hyprdots/blob/67b351bd52fe155d79fd581217d59816f102d2c0/Configs/.config/bashrc/09_other.sh)
      - Added [ zoxide ](https://github.com/ajeetdsouza/zoxide) as a `cd` command alternative, see [custom_hypr.lst](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/custom_hypr.lst), [zshrc/07_zocide.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/zshrc/07_zoxide.sh) & [bashrc/09_zoxide.sh](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.config/bashrc/07_zoxide.sh)
      - Have a look at the [zshrc folder](https://github.com/Gl00ria/hyprdots/tree/gl00ria_remix/Configs/.config/zshrc) for more
    - Bash: Same as ZSH but without plugins
      - Have a look at the [bashrc folder](https://github.com/Gl00ria/hyprdots/tree/gl00ria_remix/Configs/.config/bashrc) for more

11. Other:
    - [.editorconfig](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.editorconfig) will be placed in `$HOME`
    - [.gitconfig](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.gitconfig) will be placed in `$HOME`
    - [Tmux](https://github.com/tmux/tmux/wiki) [config](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Configs/.tmux.conf) will be placed in `$HOME`
    - [Alacritty terminal](https://github.com/alacritty/alacritty) [config](https://github.com/Gl00ria/hyprdots/tree/gl00ria_remix/Configs/.config/alacritty) will be placed in `.config`
    - [Bat](https://github.com/sharkdp/bat) [config](https://github.com/Gl00ria/hyprdots/tree/gl00ria_remix/Configs/.config/bat) will be placed in `.config`
    - [Btop](https://github.com/aristocratos/btop) [config](https://github.com/Gl00ria/hyprdots/tree/gl00ria_remix/Configs/.config/btop) will be placed in `.config`
    - [Lazygit](https://github.com/jesseduffield/lazygit) [config](https://github.com/Gl00ria/hyprdots/tree/gl00ria_remix/Configs/.config/lazygit) will be placed in `.config`
    - [Zathura](https://github.com/pwmt/zathura) [config](https://github.com/Gl00ria/hyprdots/tree/gl00ria_remix/Configs/.config/zathura) will be placed in `.config`

App's config folder/file won't be moved to `$HOME or .config` unless installed, see [custom_hypr.lst](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/custom_hypr.lst), [custom_apps.lst](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/custom_hypr.lst) & [restore_cfg.lst](https://github.com/Gl00ria/hyprdots/blob/gl00ria_remix/Scripts/restore_cfg.lst) for more

<div align="center"><table><tr>Grub Themes</tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_Grub_aesthetic.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_Grub_doraemon.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_Grub_gradient.png"/></td></tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_Grub_neon_purple.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_Grub_sekiro.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_Grub_cyberpunk.jpg"/></td></tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_Grub_vimix.jpg"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_Grub_boo.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_Grub_bsol.png"/></td></tr>
</table></div>

<div align="center"><table><tr>Gallery</tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_preview.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_Shell_starship_fastfetch.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_Shell_fzf_bat.png"/></td></tr><tr><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_nvim_1.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_nvim_2.png"/></td><td>
<img src="https://raw.githubusercontent.com/Gl00ria/hyprdots/gl00ria_remix/Source/assets/Gl00ria_nvim_3.png"/></td></tr>
</table></div>

### _NOTE_: Find my old dotfiles [here](https://github.com/Gl00ria/dotfiles)

# Get inspired, enjoy & leave a STAR.
