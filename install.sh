#!/bin/sh

start_time=$SECONDS
echo "hi! whether you inspect the script or already installing the dotfile, please ensure that its all is made for personal use, so if you'd have some issues, make sure to write them in the issues tab!"
echo "https://www.github.com/xienuss/dotfiles/issues"
echo ""
echo "you are likely will need to enter sudo password several times through this install, so please dont leave the process run by itself the whole time"
sleep 2

echo ""
echo "now, select the pacman wrapper that you prefer:"

pacwrap=""
echo "if you already have one of those, choose it"
echo "1 - paru"
echo "2 - yay"
echo "3 - continue without any"
while true; do
 read -p "choose the number (1, 2 or 3): " choice < /dev/tty
 case $choice in
    1)
	if ! command -v paru &> /dev/null; then
        echo "installing paru..."
        sudo pacman -S --needed base-devel && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si
	else
	echo "paru is already installed, next step"
	fi
	pacwrap="paru"
	break
        ;;
    2)
	if ! command -v yay &> /dev/null; then
        echo "installing yay..."
        sudo pacman -S --needed base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
	else
        echo "yay is already installed, next step"
	fi
	pacwrap="yay"
	break
        ;;
    3)
	echo "are you really sure you want to continue without any of listed package managers? you will get a list of packages that you would need to install for everything to work fine"
	read -p "are you sure? (type 'y' / 'Y' to continue or anything else to abort): " confirm < /dev/tty
		            case $confirm in
                y|Y)
                    echo ""
                    break
                    ;;
                *)
                    echo ""
                    ;;
            esac
            ;;
    *)
        echo "nope, no choice like that, try again"
	echo ""
        ;;
    esac
done

sleep 0.5
echo "now, for the user experience packages: here is a list of packages i use, they are fully optional, but i recommend to check some from this list"

packages=(
    "google-chrome-stable"
    "hiddify-next"
    "prismlauncher"
    "youtube-music"
    "localsend"
    "materialgram"
)

echo "select packages by typing the numbers separated by spaces (e.g. 1 2 3):"
for i in "${!packages[@]}"; do
    echo "  $((i+1))) ${packages[i]}"
done
echo " or press enter to skip."

read -p "choose your packages (eg. 2 4 67): " optpkgs1 < /dev/tty

optpkgs2=()
for choice in $optpkgs1; do
    index=$((choice-1))
    optpkgs+=("${packages[index]}")
done

neededpkgs="base-devel pipewire hyprland waybar mako btop swww fish starship matugen grim slurp git yazi rofi-wayland nano imv pavucontrol jq wl-clipboard cmake meson cpio pkg-config gcc ttf-material-symbols-variable-git"

echo ""
echo "processing the dependecies & optional packages.."
if [ -n "$pacwrap" ]; then
    $pacwrap -Sy --sudoloop --needed $neededpkgs $optpkgs2 < /dev/tty
else
    echo "packages you may need to install manually for everything to work well (as you picked no pacman wrapper):"
    echo "$neededpkgs $optpkgs2"
    sleep 3
fi

echo ""
echo "downloading the dotfiles.."
mkdir $HOME/.cache/ && cd "$HOME/.cache/"
git clone https://github.com/xienuss/dotfiles.git
cd dotfiles
cp -r .config/ $HOME/.config/
mkdir $HOME/.local/bin
cp -r .local/bin/ $HOME/.local/bin/
chmod +x $HOME/.local/bin/wallchooser $HOME/.local/bin/neofetch

echo ""
echo "would you like to install the wallpapers that i use in this dotfile?"
echo "you can always check them all out: https://github.com/xienuss/dotfiles/tree/main/wp"
read -p "do you want to install wallpapers? (type 'y' / 'Y' to accept or anything else to decline): " wppack < /dev/tty
                            case $wppack in
        y|Y)
            echo "if you want to change wallpapers - put some inside ~/wp/ folder and execute 'wallchooser' script"
	    cp -r wp/ $HOME/wp/
	    swww init | swww img $HOME/wp/barite.png
	    matugen image $HOME/wp/barite.png
            ;;
       *)
            echo "if you want to use wallpapers - put some inside ~/wp/ folder and execute 'wallchooser' script, you will also need to set a wallpaper for color initialization"
	    mkdir $HOME/wp/
            ;;
    esac

echo ""
echo "installing the Google Sans fonts.."
git clone https://github.com/hprobotic/Google-Sans-Font.git
cd Google-Sans-Font
rm README.md
sudo mkdir /usr/share/fonts/GoogleSans
sudo mv * /usr/share/fonts/GoogleSans
fc-cache -f

echo ""
echo "changing user's shell.."
chsh -s /usr/bin/fish < /dev/tty

echo ""
echo "cleaning up"
cd $HOME/.cache/
rm -rf dotfiles/

duration=$((SECONDS - start_time))
min=$((duration / 60))
sec=$((duration % 60))
echo "installation is done! took $min min $sec sec"
echo "reboot and enjoy"
read -p "want to reboot? (type 'y' / 'Y' to accept or anything else to decline): " reboot < /dev/tty
                            case $reboot in
        y|Y)
	    reboot
            ;;
       *)
	    exit 0
            ;;
    esac

