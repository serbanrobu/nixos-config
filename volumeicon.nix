{ pkgs, ... }:

{
  home.packages = with pkgs; [ 
    volumeicon
    pavucontrol
  ];

  xsession.initExtra = ''
    volumeicon &
  '';
}
