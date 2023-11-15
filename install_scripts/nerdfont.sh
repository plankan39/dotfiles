#!/usr/bin/env bash

sudo dnf install fira-code-fonts -y

fontName="NerdFontsSymbolsOnly"
fontsURL="/usr/local/share/fonts/$fontName"
nerdfontsURL="https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"
downloadURL=$(
	curl -s $nerdfontsURL |
		grep "browser_download_url.*$fontName.tar.xz" |
		cut -d : -f 2,3 |
		tr -d \"
)

echo $fontName
echo $fontsURL
echo $downloadURL

sudo mkdir -p $fontsURL
sudo chown -R root: $fontsURL

tarball="$fontsURL/$fontName.tar.xz"
sudo curl -L $downloadURL -o $tarball
sudo tar -Jxf $tarball -C $fontsURL
sudo rm $tarball

sudo chmod 644 $fontsURL/*
sudo restorecon -vFr $fontsURL
sudo fc-cache -v

gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Code 12'
