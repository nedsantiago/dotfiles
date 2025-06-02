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
    ./texlive.nix           # use when making latex documents
    ./users.nix
    ./xserver.nix
  ];
}
