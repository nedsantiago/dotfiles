{ config, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      (pkgs.python312.withPackages (python-pkgs: [
        python-pkgs.pandas
        python-pkgs.numpy
        python-pkgs.matplotlib
        python-pkgs.jupyterlab
      ]))
    ];
  };
}
