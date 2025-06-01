{ config, pkgs, ...}:

{
    config = {
        environment.systemPackages = with pkgs; [
            brightnessctl   # tool for changing screen brightness
        ];
    # Try changing the brightness using this terminal command:
    # brightnessctl set 20%
    };
}
