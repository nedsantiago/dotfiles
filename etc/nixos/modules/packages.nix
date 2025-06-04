# Collection of all packages without its own Nix module.
# In other words, uncustomized-packages are declared here.
{ config, pkgs, ... }:

{
    # nixpkgs.config.allowUnfreePredicate = pkgs:
    #     builtins.elem (lib.getName pkgs) [
    #         "bws"
    #     ];

    config = {

        # List packages installed in system profile. To search, run:
        # $ nix search wget
        environment.systemPackages = with pkgs; [
            # Terminal Packages
            alacritty       # primary terminal
            kitty           # backup terminal
            neovim          # text editor
            tmux            # terminal panes
            # mosh            # ssh with unstable internet
            # zsh             # alternative shell
            
            # File Management Packages
            bat             # print and view file to terminal
            eza             # a robust file listing tool
            fselect         # sql-like file management
            dua             # disk usage
            ripgrep         # find keywords in a file or directory
            tree            # show file tree
            exiftool        # read and edit file metadata
            ranger          # a file explorer with file preview

            # Secrets Management Tools
            pinentry-curses # pinentry for gpg
            # sops            # file encryption and secrets manager
            # pass            # password manager
            # bws             # bitwarden secrets management
            # jq              # json query interpreter (needed for bitwarden)

            # My Development packages
            git             # version control
            # ollama          # large language model

            # Window Manager packages
            neofetch        # summarizes system configuration
            polybar         # system status bar
            rofi            # startup application
            dunst           # notification manager
            feh             # wallpaper manager
            pywal           # wallpaper manager and color selector

            # My Packages
            # flatpak         # package manager
            firefox         # main browser
            lynx            # text-based browser
            wget            # cli downloader
            unzip           # unzips downloaded files
            xclip           # clipboard manager
        ];
    };
}
