{ ... }:

{
  imports = [
    ./app_defaults.nix
    ./brightness.nix
    ./docker.nix
    ./fonts.nix
    # ./hyprland.nix        # either hyprland or xserver should be online
    ./localization.nix
    ./networking.nix
    # ./nvidia.nix          # uncomment when using an nvidia gpu
    ./packages.nix
    ./users.nix
    ./xserver.nix
  ];
}
