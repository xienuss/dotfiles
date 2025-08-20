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
### screenshots
<img height="300" alt="image" src="https://github.com/user-attachments/assets/39122537-fb71-411e-bcc6-64728b344796" />
<img height="300" alt="image" src="https://github.com/user-attachments/assets/a1a06bc8-f067-45cf-b18f-2c0e09572d58" />

## installation
for now i'll only say the dependencies in there, so you need:
- arch linux clean installation
- configured pacman servers (optional)
- any AUR package manager (i use yay & paru)
- Google sans font pack

now install the package dependencies:
```
paru -Sy base-devel pipewire hyprland waybar mako swww fish starship matugen grim slurp git neofetch yazi rofi-wayland nano imv pavucontrol jq wl-clipboard
```
optionals (things i use):
```
paru -S google-chrome-stable hiddify-next-bin prismlauncher youtube-music localsend materialgram
```

i will make a script for auto installation later when everything will be done.
