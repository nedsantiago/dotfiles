# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules
    ];
  
  # console = {
  #   font = "fira-code";
  #   keyMap = "us";
  # };

  # # Pipewire for audio
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  #   alsa.enable = true;
  #   jack.enable = true;
  # };

  # # Settings to help enable GNUPG (PGP)
  # services.pcscd.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   pinentryPackage = pkgs.pinentry-curses;
  #   enableSSHSupport = true;
  # };
  
  # # Settings to help enable GNUPG (PGP)
  # services.pcscd.enable

  # Pipewire for audio<D-2>
  networking.hostName = "nixos"; # Define your hostname.

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nix-admin = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };

  # nixpkgs.config.allowUnfreePredicate = pkgs:
  #   builtins.elem (lib.getName pkgs) [
  #     "bws"
  #   ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [

    # Terminal Packages
    alacritty       # primary terminal
    kitty           # backup terminal
    neovim          # text editor
    tmux            # terminal panes
    # mosh            # ssh with unstable internet
    # zsh             # alternative shell
    
    # File Management Packages
    bat             # print and view file to terminal
    eza             # a robust file listing tool
    fselect         # sql-like file management
    dua             # disk usage
    ripgrep         # find keywords in a file or directory
    tree            # show file tree
    exiftool        # read and edit file metadata

    # Secrets Management Tools
    # gnupg           # encryption key generator
    pinentry-curses # pinentry for gpg
    # sops            # file encryption and secrets manager
    # pass            # password manager
    # bws             # bitwarden secrets management
    # jq              # json query interpreter (needed for bitwarden)

    # My Development packages
    git             # version control
    # ollama          # large language model

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

  services.picom.enable = true;

  # Assign default apps
  environment.sessionVariables = {
    # WLR_NO_HARDWARE_CURSORS = "1";
    # NIXOS_OZONE_WL = "1";
    EDITOR = "neovim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  virtualisation.docker = {
    enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  # hardware.opengl.enable = true;

  # # Ensure NVIDIA is properly configured
  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   package = pkgs.nvidiaPackages.stable;
  # };
  # boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # xdg.portal.config.common.default = "*";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-a852f5d6-b908-4ebd-99f9-7fca50fa0552".device = "/dev/disk/by-uuid/a852f5d6-b908-4ebd-99f9-7fca50fa0552";

  system.stateVersion = "25.05"; # Did you read the comment?
}
