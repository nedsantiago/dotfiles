# Font Declarations
{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    dina-font
  ];
}
