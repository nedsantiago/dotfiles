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
    neovim
    wget
    tree
    bat
    eza
    fselect
    dua
    alacritty
    firefox
    # My development packages
    git
    # Window manager packages
    neofetch
    polybar
    rofi
    dunst
  ];

  # Switch from GDM to SDDM
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

