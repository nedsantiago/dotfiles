# Ned Santiago's dotfiles

A collection of Ned Santiago's config files. Configurations primarily target NixOS but configs (inside `config` directory) can be used in other Linux distrubutions. However, mileage may vary with older packages especially with Linux distributions with slower release models, e.g. Ubuntu LTS, Debian, Rocky Linux, etc.

## Why?

Setup configuration is time consuming. This NixOS setup aims to reduce time setting up new computers. So, why not make my configurations reproduceable and long-lasting?

## Goals
Create a reproducible configuration that will support my programming work.
- Better secrets management
- Better development tools
- Better development environment closer to a server environment

## Configuration

- OS: NixOS
- Shell: Bash 5.2.37
- Desktop Environment: none+i3
- Window Manager: i3
- Terminal: Alacritty
- Text Editor: Neovim
- Browser: Firefox

### Additional Packages

- Menu Bar: Polybar
- Startup: Rofi
- Wallpaper Manager: Feh
- Color manager: Pywal

## Usage

When using NixOS, run:

```
source scripts/setup.sh
```

