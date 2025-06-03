{ config, pkgs, ... }:

{
    config = {
      environment.systemPackages = with pkgs; [
        # Encryption
        gnupg       # used for symmetric envryption
      ];
    };

    config = {
      services.pcscd.enable = true;
    };

    # Settings to help enable GNUPG (PGP)
    config = {
      programs.gnupg.agent = {
          enable = true;
          pinentryPackage = pkgs.pinentry-curses;
          enableSSHSupport = true;
      };
    };
}
