{ config, lib, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    dina-font
  ];

  time.timeZone = "Asia/Singapore";

  console = {
    font = "fira-code";
    keyMap = "us";
  };

  # Pipewire for audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  # Settings to help enable GNUPG (PGP)
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
  };
  # Enabling xserver and i3
  services.xserver.enable = true;
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.windowManager.i3 = {
    enable = true;
  };
  services.picom.enable = true;

  services.displayManager.defaultSession = "none+i3";

  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker"];
  };
  users.extraUsers.present = {
    isNormalUser = true;
    home="/home/present/";
  };
  users.extraUsers.work = {
    isNormalUser = true;
    home="/home/work/";
  };

  # nixpkgs.config.allowUnfreePredicate = pkgs:
  #   builtins.elem (lib.getName pkgs) [
  #     "bws"
  #   ];

  environment.systemPackages = with pkgs; [

    # Terminal Packages
    alacritty       # primary terminal
    kitty           # backup terminal
    neovim          # text editor
    # tmux            # terminal panes
    # mosh            # ssh with unstable internet
    zsh             # alternative shell
    
    # File Management Packages
    bat             # print and view file to terminal
    eza             # a robust file listing tool
    fselect         # sql-like file management
    dua             # disk usage
    ripgrep         # find keywords in a file or directory
    tree            # show file tree
    exiftool        # read and edit file metadata

    # Secrets Management Tools
    gnupg           # encryption key generator
    pinentry-curses # pinentry for gpg
    sops            # file encryption and secrets manager
    pass            # password manager
    # bws             # bitwarden secrets management
    # jq              # json query interpreter (needed for bitwarden)

    # My Development packages
    git             # version control
    docker          # container
    docker-compose  # docker manager and interface
    ollama          # open-source language model

    # Window Manager packages
    neofetch        # summarizes system configuration
    polybar         # system status bar
    rofi            # startup application
    dunst           # notification manager
    feh             # wallpaper manager
    pywal           # wallpaper manager and color selector

    # My Packages
    # flatpak         # package manager
    firefox         # main browser
    lynx            # text-based browser
    wget            # cli downloader
    xclip           # clipboard manager
    ];

  # Enable and install Docker
  virtualisation.docker = {
    enable = true;
    # remove persistent root requirement
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    EDITOR = "neovim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  hardware.opengl.enable = true;

  # Ensure NVIDIA is properly configured
  hardware.nvidia = {
    modesetting.enable = true;
    package = pkgs.nvidiaPackages.stable;
  };
  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.05";
}
