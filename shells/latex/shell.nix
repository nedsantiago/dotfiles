let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  packages = [
    (
      pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-full
          # dvisvgm dvipng # for preview and export as html
          # wrapfig amsmath ulem hyperref capt-of;
          # enumitem substr xstring xifthen lastpage biblatex
          # ifmtarg csquotes tabular
          europasscv;
      }
    )
  ];
}
# { config, pkgs, ... }:
# 
# let
#     # Create a variable to hold the preferred packages
#     tex = (pkgs.texlive.combine {
#         inherit (pkgs.texlive) scheme-full
#             # dvisvgm dvipng # for preview and export as html
#             # wrapfig amsmath ulem hyperref capt-of;
#             # enumitem substr xstring xifthen lastpage biblatex
#             # ifmtarg csquotes tabular
#             europasscv;
#     });
# in
# {
#     config = {
#         environment.systemPackages = with pkgs; [
#             tex
#         ];
#     };
# }
# 
