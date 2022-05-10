#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/apps.rasi"

# Links
quicklinks=""
mpd=""
screenshot=""
network=""
volume="墳"
backlight=""
battery=""
powermenu=""

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$quicklinks\n$mpd\n$screenshot\n$network\n$volume\n$backlight\n$battery\n$powermenu"

chosen="$(echo -e "$options" | $rofi_command -p "Applets" -dmenu -selected-row 0)"
case $chosen in
    $quicklinks)
		if [[ -f /usr/bin/firefox ]]; then
			$HOME/.config//rofi/applets/menu/quicklinks_firefox.sh
		elif [[ -f /usr/bin/google-chrome-stable ]]; then
			$HOME/.config//rofi/applets/menu/quicklinks_chrome.sh
		elif [[ -f /usr/bin/brave ]]; then
			$HOME/.config//rofi/applets/menu/quicklinks_brave.sh
		else
			msg "No suitable web browser found!"
		fi
        ;;
    $mpd)
		$HOME/.config//rofi/applets/menu/mpd.sh
        ;;
    $screenshot)
		$HOME/.config//rofi/applets/menu/screenshot.sh
	;;

    $network)
		$HOME/.config//rofi/applets/menu/network.sh
	;;

    $volume)
		$HOME/.config//rofi/applets/menu/volume.sh
	;;

    $backlight)
		$HOME/.config//rofi/applets/menu/backlight.sh
	;;

    $battery)
		$HOME/.config//rofi/applets/menu/battery.sh
	;;
    $powermenu)
		$HOME/.config//rofi/applets/menu/powermenu.sh
esac
