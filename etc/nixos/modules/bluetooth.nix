{ config, pkgs, ... }:

{
  # Allow for bluetooth connetions
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

}
