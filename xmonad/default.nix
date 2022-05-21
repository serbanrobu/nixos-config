{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    brave
    dmenu
    scrot
  ];

  imports = [
    ../xmobar
  ];

  xsession = {
    enable = true;

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ./config.hs;
    };
  };
}
