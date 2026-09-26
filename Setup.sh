#!/bin/bash

clear
echo "// Requesting Admin Password"
echo

sudo -v

clear
echo "// Make Sure You Have Unrestricted Internet Before Proceeding! (Press Enter To Continue)"
echo

read

clear
echo "// Installing DNF Packages"
echo

sudo dnf install speedtest -y
sudo dnf group install virtualization -y

clear
echo "// Installing RPM Packages"
echo

cd ~
wget -O code.rpm "https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64"

clear

sudo dnf install ./code.rpm -y
sudo rm -rf ./code.rpm

clear
echo "// Installing Flatpaks"
echo

flatpak install -y flathub com.obsproject.Studio dev.vencord.Vesktop com.spotify.Client com.dec05eba.gpu_screen_recorder md.obsidian.Obsidian org.telegram.desktop com.rafaelmardojai.Blanket com.mattjakeman.ExtensionManager org.localsend.localsend_app com.valvesoftware.Steam no.mifi.losslesscut io.github.ungoogled_software.ungoogled_chromium com.github.tchx84.Flatseal org.vinegarhq.Sober com.infinipaint.infinipaint app.zen_browser.zen ca.desrt.dconf-editor io.github.josephmawa.Bella org.prismlauncher.PrismLauncher org.kde.krita

clear
echo "// Creating Default Config Files"
echo

code &
sleep 5
pkill -9 code

flatpak run app.zen_browser.zen &
sleep 5
pkill -9 zen

flatpak run com.obsproject.Studio &
sleep 5
pkill -9 obs

flatpak run org.vinegarhq.Sober &
sleep 5
pkill -9 sober

flatpak run org.prismlauncher.PrismLauncher &
sleep 5
pkill -9 prismrun

flatpak override --user --filesystem=xdg-run/app/com.discordapp.Discord:create --filesystem=xdg-run/discord-ipc-0 org.vinegarhq.Sober

echo
echo "// Installing VSCode Extensions"
echo

code --install-extension ms-python.python

clear
echo "// Copying Custom Configurations"
echo

sudo rsync -a $(dirname "$(readlink -f "$0")")/Files/ ~/

clear
echo "// Done!"