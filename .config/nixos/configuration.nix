{ config, lib, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Pipewire for audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
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
    pass            # password and secrets manager
    gnupg           # encryption key generator
    pinentry-gnome3 # pinentry for gpg
    firefox
    # My development packages
    git             # version control
    docker          # container
    # Window manager packages
    neofetch        # summarizes system configuration
    polybar         # system status bar
    rofi            # startup application
    dunst           # notification manager
    feh             # wallpaper manager
  ];

  # Settings to help enable GNUPG (PGP)
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = "pkgs.pinentry-gnome3";
    enableSSHSupport = true;
  };
  # Enabling xserver and i3
  services.xserver.enable = true;
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      i3status
      i3lock
      i3blocks
    ];
  };
  services.picom.enable = true;

  services.displayManager.defaultSession = "none+i3";

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

  system.stateVersion = "24.05";
}

