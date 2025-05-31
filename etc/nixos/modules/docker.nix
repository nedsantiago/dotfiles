{ config, pkgs, ... }:

{
    config = {
        environment.systemPackages = with pkgs; [
            docker              # containerization
            docker-compose      # container management
        ];
    };
}
