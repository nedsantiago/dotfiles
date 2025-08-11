{ ... }:

{
  imports = [
    ./app_defaults.nix
    ./brightness.nix
    ./c.nix
    ./docker.nix
    ./fonts.nix
    # ./hyprland.nix        # either hyprland or xserver should be online
    ./localization.nix
    ./networking.nix
    # ./nvidia.nix          # uncomment when using an nvidia gpu
    ./packages.nix
    # ./pgp.nix               # WIP, it couldnt find pinentery
    ./python.nix
    # ./texlive.nix           # use when making latex documents
    ./bluetooth.nix
    ./rust.nix
    ./users.nix
    ./xserver.nix
  ];
}
