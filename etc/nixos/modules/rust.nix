{ config, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      cargo
      rustc
    ];
  };
}
