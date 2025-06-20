let
  # Pinned nixpkgs, deterministic. Last updated: 2/12/21.
  # pkgs = import (fetchTarball("https://github.com/NixOS/nixpkgs/archive/a58a0b5098f0c2a389ee70eb69422a052982d990.tar.gz")) {};

  # Last updated: 2025-06-19 from https://github.com/NixOS/nixpkgs/commit/36ab78dab7da2e4e27911007033713bab534187b
  pkgs = import (fetchTarball("https://github.com/NixOS/nixpkgs/archive/36ab78dab7da2e4e27911007033713bab534187b.tar.gz")) {};

  # Rolling updates, not deterministic.
  # pkgs = import (fetchTarball("channel:nixpkgs-unstable")) {};
in pkgs.mkShell {
  buildInputs = [ pkgs.cargo pkgs.rustc ];
}
