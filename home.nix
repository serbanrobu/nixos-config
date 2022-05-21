{ config, pkgs, username, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # home.stateVersion = "22.05";

  home.packages = with pkgs; [ 
    bat
    fd
    htop
    killall
    pfetch
    procs
    ripgrep
    tealdeer
  ];

  imports = [
    ./xmonad
  ];

  programs = {
    exa = {
      enable = true;
      enableAliases = true;
    };

    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
        pfetch
      '';
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    lf = {
      enable = true;
      settings = {
        icons = true;
      };
    };

    neovim = {
      enable = true;

      extraConfig = ''
        set expandtab
        set shiftwidth=2
        set smartindent
        set tabstop=2
      '';

      viAlias = true;
      vimAlias = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  services = {
    udiskie.enable = true;
  };
}
