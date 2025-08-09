{ config, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      cargo               # Rust crate (package) manager
      rustc               # Rust compiler
      cargo-tarpaulin     # code coverage tool
    ];
  };
}
