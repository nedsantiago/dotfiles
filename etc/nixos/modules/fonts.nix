# Font Declarations
{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    liberation_ttf
    fira-code
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];
}
