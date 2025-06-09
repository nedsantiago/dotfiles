# Ned Santiago's dotfiles

A collection of Ned Santiago's config files. These configurations target NixOS but several files (especially inside the `config` directory) can be used in other Linux distrubutions. However, mileage may vary. Configs may not work in distributions with slower release models and older packages, e.g. Ubuntu LTS, Debian, Rocky Linux, etc.

## Why?

Computers are a part of our lives. It is our notes and our entertainment, our hobbies and our work. We spend alot of time in front of them. And just like many other programmers, I also wondered "how do I optimize this?" Improving my computer would likely improve my workflow too. Thus, I decided to configure my own system. It is a rewarding experience to configure my own system. And the result is an environment that caters to my preferences and habits.

## Goals
Create a reproducible configuration that will support my programming work.
- Better secrets management (currently considering symmetric encrypted *.env files)
- Better development tools
- Better development environment closer to a server environment

## Configuration

- OS: NixOS
- Shell: Fish 4.0.2
- Desktop Environment: none+i3
- Window Manager: i3
- Terminal: Kitty
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

