#!/usr/bin/env bash

DEFAULT_ACCENT="maroon"
DEFAULT_VARIANT="Dark"

variant=${1:-$DEFAULT_VARIANT}
variant=${variant,,}
variant=${variant^}

accent=${2:-$DEFAULT_ACCENT}
accent=${accent,,}

# Temporary directory for duration of script
TMPDIR=$(mktemp -d)

# Install dependencies
sudo dnf install --assumeyes \
	gnome-shell-extension-user-theme \
	papirus-icon-theme \
	libreoffice-icon-theme-papirus

gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# Clone repo into $TMPDIR AND prepare python env
cd $TMPDIR
git clone --recurse-submodules git@github.com:catppuccin/gtk.git

cd gtk
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Install all flavors
python install.py all -a $accent --tweaks normal

# Find theme name and color scheme
if [ ${variant} = "Light" ]; then
	nameFlavour="Latte"
	colorScheme="default"
else
	nameFlavour="Frappe"
	colorScheme="prefer-dark"
fi

if [ ${accent} = "all" ]; then
	nameAccent=${DEFAULT_ACCENT^}
else
	nameAccent=${accent^}
fi

name="Catppuccin-${nameFlavour}-Standard-${nameAccent}-${variant}"

# Apply the theme and color scheme
# TODO:Extract theme appplier to own script

echo "Applying theme: ${name}"

gsettings set org.gnome.shell.extensions.user-theme name $name
gsettings set org.gnome.desktop.interface gtk-theme $name
gsettings set org.gnome.desktop.interface color-scheme $colorScheme

# GTK 4 symlinks
GTK4DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}/gtk-4.0"
THEME_DIR="${HOME}/.themes/${name}/gtk-4.0"

mkdir -p $GTK4DIR
rm -rf ${GTK4DIR}/{assets,gtk.css,gtk-dark.css}
ln -sf "${THEME_DIR}/assets" "${GTK4DIR}/assets"
ln -sf "${THEME_DIR}/gtk.css" "${GTK4DIR}/gtk.css"
ln -sf "${THEME_DIR}/gtk-dark.css" "${GTK4DIR}/gtk-dark.css"

# Papirus
cd $TMPDIR
git clone git@github.com:catppuccin/papirus-folders.git
sudo cp -r ./papirus-folders/src/* /usr/share/icons/Papirus
./papirus-folders/papirus-folders -C cat-frappe-${accent} --theme Papirus-Dark
./papirus-folders/papirus-folders -C cat-latte-${accent} --theme Papirus-Light
./papirus-folders/papirus-folders -C cat-${nameFlavour,,}-${accent} --theme Papirus

gsettings set org.gnome.desktop.interface icon-theme "Papirus-${variant}"

# Clean up
rm -rf $TMPDIR
