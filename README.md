# dotfiles
my archlinux\hyprland dotfiles, **HEAVILY** inspired by android & [material design 3](m3.material.io). also i kinda don't like tiling, so its just turned off in here :p
### here's what is done so far:
- [x] hyprland config
- [ ] hyprlock
- [x] waybar
- [ ] rofi
- [x] notifications [mako]
- [x] terminal [kitty, fish&starship] (will add some changes to fish later)
- [ ] yazi (~~theming~~, keymap)
- [ ] etc. (~~wallpaper changing script~~, logout menu, settings menu, cursors, GTK)
i am a lazy kind, so it would be done probably not sooner than a year later, lol
### screenshots
<img height="540" alt="image" src="https://github.com/user-attachments/assets/7a410fdf-cde0-4764-ba26-9e80878ab35a" />

## installation
for now i'll only say the dependencies in there, so you need:
- arch linux clean installation
- configured pacman servers (optional)
- any AUR package manager (i use paru)
- Google sans font pack

now install the package dependencies:
```
paru -Sy base-devel pipewire hyprland waybar mako btop swww fish starship matugen grim slurp git neofetch yazi rofi-wayland nano imv pavucontrol jq wl-clipboard
```
also if you want to use hyprland plugins, hyprpm needs the following:
```
paru -S cmake meson cpio pkg-config git gcc
```
optionals (things i use):
```
paru -S google-chrome-stable hiddify-next-bin prismlauncher youtube-music localsend materialgram
```

i will make a script for auto installation later when everything will be done.
