{ config, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.pandas
      ]))
    ];
  };
}
