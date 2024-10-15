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

  environment.systemPackages = with pkgs; [
    # My packages
    alacritty       # primary terminal
    kitty           # backup terminal
    neovim          # text editor
    wget
    tree
    bat
    eza
    fselect
    dua
    ripgrep         # command: rg
    exiftool        # check metadata (find file's original source)
    pass            # password and secrets manager
    gnupg           # encryption key generator
    pinentry-curses # pinentry for gpg
    firefox         # main browser
    lynx            # text-based browser
    # My development packages
    git             # version control
    docker          # container
    docker-compose
    # Window manager packages
    neofetch        # summarizes system configuration
    polybar         # system status bar
    rofi            # startup application
    dunst           # notification manager
    feh             # wallpaper manager
    pywal           # color selector based on background/wallpaper
    # Additional system packages
    zsh
  ];

  # Enable and isntall Docker
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
