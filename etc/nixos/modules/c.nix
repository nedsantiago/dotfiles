{ config, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      gcc       # C language compiler
      gnumake   # Control generation of non-source files from sources
      valgrind  # C debugger
    ];
  };
}
