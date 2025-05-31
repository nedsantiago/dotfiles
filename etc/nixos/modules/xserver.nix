# X11 implementation module
{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    windowManager.i3.enable = true;
  };

  # services.displayManager.defaultSession = "none+i3"; # Seemed optional
}
