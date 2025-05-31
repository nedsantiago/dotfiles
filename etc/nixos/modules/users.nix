# User delcarations
{ config, pkgs, ... }:

{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    # My primary user
    users.users.nix-admin = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        packages = with pkgs; [];
    };
}
