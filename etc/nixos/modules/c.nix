{ config, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      gcc    # C language compiler
    ];
  };
}
