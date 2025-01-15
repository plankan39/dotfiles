#!/usr/bin/env bash

set -euo pipefail  # Enable strict error handling

# Variables
font_name="NerdFontsSymbolsOnly"
font_install_dir="/usr/local/share/fonts/$font_name"
nerd_fonts_api_url="https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"

# Functions
function log {
    echo -e "[INFO] $1"
}

function error {
    echo -e "[ERROR] $1" >&2
    exit 1
}

# Fetch the download URL for the font tarball
log "Fetching the latest release information for $font_name..."
font_tarball_url=$(curl -fsSL "$nerd_fonts_api_url" | grep -Eo "https://[^\"]*$font_name\.tar\.xz") || error "Failed to fetch the download URL."

if [[ -z "$font_tarball_url" ]]; then
    error "Could not find a download URL for $font_name."
fi

log "Download URL: $font_tarball_url"

# Prepare the fonts directory
log "Preparing the fonts directory at '$font_install_dir'..."
if [[ -d "$font_install_dir" ]]; then
    log "Existing directory found. Removing it..."
    sudo rm -rf "$font_install_dir"
fi
sudo mkdir -p "$font_install_dir"

# Download and extract the font tarball
font_tarball_path="$font_install_dir/$font_name.tar.xz"
log "Downloading $font_name..."
sudo curl -fsSL "$font_tarball_url" -o "$font_tarball_path" || error "Failed to download $font_name."

log "Extracting $font_name..."
sudo tar -Jxf "$font_tarball_path" -C "$font_install_dir" || error "Failed to extract the tarball."
sudo rm "$font_tarball_path"

# Set permissions
log "Setting permissions for $font_install_dir..."
sudo chown -R root:root "$font_install_dir"
sudo find "$font_install_dir" -type d -exec chmod 755 {} +
sudo find "$font_install_dir" -type f -exec chmod 644 {} +

# Apply SELinux context restoration
if command -v restorecon &>/dev/null; then
    log "Restoring SELinux context for $font_install_dir..."
    sudo restorecon -Fr "$font_install_dir"
else
    log "restorecon not found. Skipping SELinux context restoration."
fi

# Create symlink for fontconfig configuration
font_config_file="$font_install_dir/10-nerd-font-symbols.conf"
if [[ -f "$font_config_file" ]]; then
    log "Creating fontconfig symlink for $font_config_file..."
    sudo ln -sf "$font_config_file" "/etc/fonts/conf.d/10-nerd-font-symbols.conf"
else
    log "Configuration file not found. Skipping symlink creation."
fi

# Refresh the font cache
log "Refreshing font cache..."
sudo fc-cache -f || error "Failed to refresh the font cache."

log "$font_name installation completed successfully!"
