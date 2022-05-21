{
  imports = [
    ../volumeicon.nix
  ];

  programs.xmobar = {
    enable = true;
    extraConfig = ''
      Config { overrideRedirect = False
             , font     = "xft:iosevka-9"
             , bgColor  = "#5f5f5f"
             , fgColor  = "#f8f8f2"
             , position = TopW L 90
             , commands = [ Run Weather "EGPF"
                              [ "--template", "<weather> <tempC>°C"
                              , "-L", "0"
                              , "-H", "25"
                              , "--low"   , "lightblue"
                              , "--normal", "#f8f8f2"
                              , "--high"  , "red"
                              ] 36000
                          , Run Alsa "default" "Master"
                              [ "--template", "<volumestatus>"	
                              , "--suffix"  , "True"
                              , "--"
                              , "--on", ""
                              ]
                          , Run Cpu
                              [ "-L", "3"
                              , "-H", "50"
                              , "--high"  , "red"
                              , "--normal", "green"
                              ] 10
                          , Run Memory ["--template", "Mem: <usedratio>%"] 10
                          , Run Swap [] 10
                          , Run Date "%a %Y-%m-%d <fc=#8be9fd>%H:%M</fc>" "date" 10
                          , Run XMonadLog
                          ]
             , sepChar  = "%"
             , alignSep = "}{"
             , template = "%XMonadLog% }{ %alsa:default:Master% | %cpu% | %memory% * %swap% | %EGPF% | %date% "
             }
    '';
  };

  services = {
    network-manager-applet.enable = true;
    trayer = {
      enable = true;
      settings = {
        edge = "top";
        align = "right";
        SetDockType = true;
        SetPartialStrut = true;
        expand = true;
        transparent = true;
        tint = "0x5f5f5f";
        height = 20;
      };
    };
  };
}
