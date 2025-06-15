{ config, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      docker              # containerization
      docker-compose      # container management
    ];
  };

  config = {
    virtualisation.docker = {
      enable = true;
      # For avoiding using sudo for each docker run
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}
