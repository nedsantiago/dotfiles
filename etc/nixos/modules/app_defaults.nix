{ config, pkgs, ... }:

{
    # Assign default apps
    environment.sessionVariables = {
        # WLR_NO_HARDWARE_CURSORS = "1";
        # NIXOS_OZONE_WL = "1";
        EDITOR = "neovim";
        BROWSER = "firefox";
        TERMINAL = "kitty";
    };
}
