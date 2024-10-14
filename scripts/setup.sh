#!/bin/bash


# Define dotfile repository location
DOTFILES_DIR="$HOME/dotfiles"

echo "Beginning setup script..."

# Function for copying configs
create_symlink() {
    local src=$1
    local dest=$2

    # If source file is not a file
    if [ ! -f "$src" ]; then
        echo "Warning: $src is not a file, skipping."
    # Else if destination already symlinks to source file
    elif [ "$src" -ef "$dest" ]; then
        echo "Warning: source and destination are the same $dest, skipping."
    else
	# If destination is a broken link, delete it
	if [ ! -e "$dest" ]; then
	    # Remove it
            echo "Broken link found. Attempting to delete $dest"
	    sudo rm "$dest"
        # If destination is an existing (non-symlink) file
        elif [ -f "$dest" ]; then
            # Back it up
            echo "Backing up existing $dest to ${dest}.bak"
            sudo mv "$dest" "${dest}.bak"
        fi
        # Create the symlink (soft link)
        sudo ln -s "$src" "$dest"
    fi
}

# List of .config files
CONFIG_FILES=(
    "alacritty/alacritty.toml"
    "i3/config"
    "nvim/init.vim"
    "polybar/config.ini"
    "polybar/launch.sh"
    "kitty/kitty.conf"
    "bat/config"
    "rofi/config.rasi"
)

# Loop through .config files
for file in "${CONFIG_FILES[@]}"; do
    src="$DOTFILES_DIR/config/$file"
    dest="$HOME/.config/$file"

    create_symlink "$src" "$dest"
done

NIXOS_DIR="/etc/nixos"
MY_NIXOS_DIR="etc/nixos/"
# List of nix files
NIXOS_CONF_FILES=(
    "configuration.nix"
    "hardware-configuration.nix"
)

# Add links to nixos configs
if [ -d "$NIXOS_DIR" ]; then
    for file in "${NIXOS_CONF_FILES[@]}"; do
        src="$DOTFILES_DIR/$MY_NIXOS_DIR/$file"
        dest="$NIXOS_DIR/$file"

        create_symlink "$src" "$dest"
    done
fi

HOME_CONFIG_FILES=(
    ".bashrc"
    ".zshrc"
)

# Add links to home directory associated files (RC files usually)
for file in "${HOME_CONFIG_FILES[@]}"; do
    src="$DOTFILES_DIR/home/$file"
    dest="$HOME/$file"

    create_symlink "$src" "$dest"
done

echo "Cleaning up..."

unset MY_NIXOS_DIR
unset NIXOS_DIR
unset NIXOS_CONF_FILES

unset HOME_CONFIG_FILES

unset src
unset dest
unset file
unset DOTFILES_DIR

echo "Completed setup script..."
