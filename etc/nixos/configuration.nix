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

  environment.systemPackages = with pkgs; [
    # Mostly implemented in module/packages.nix
  ];

  virtualisation.docker = {
    # Mostly implemented in module/docker.nix
  };


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


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

  # Pipewire for audio<D-2>


  # # Settings to help enable GNUPG (PGP)
  # services.pcscd.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   pinentryPackage = pkgs.pinentry-curses;
  #   enableSSHSupport = true;
  # };
  
  # # Settings to help enable GNUPG (PGP)
  # services.pcscd.enable

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  services.picom.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).


  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # xdg.portal.config.common.default = "*";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-a852f5d6-b908-4ebd-99f9-7fca50fa0552".device = "/dev/disk/by-uuid/a852f5d6-b908-4ebd-99f9-7fca50fa0552";

  system.stateVersion = "25.05"; # Did you read the comment?
}
