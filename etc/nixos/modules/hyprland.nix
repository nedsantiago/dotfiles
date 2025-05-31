{ ... }:

{
    # Hyprland tends to fail without basic xserver implementation
    services.xserver.enable = true;

    services.displayManager.defaultSession = "hyrpland";

    programs.hyprland = {
        enable = true;
        xwayland.enable = true; # Allows X-11 only apps to run
    };
}
