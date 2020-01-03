{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    adobe-reader
    aspell
    aspellDicts.en
    chromium
    dropbox
    emacs
    feh
    firefox
    keepassx
    openvpn
    termite
    transmission_gtk
    vlc
    xfce.thunar-archive-plugin
    xfce.thunar-dropbox-plugin
    xfce.thunar-volman
    zathura
    zoom-us
  ];

  fonts = {
    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      dejavu_fonts
      freefont_ttf
      inconsolata
      terminus_font
      ubuntu_font_family
      (callPackage ../fonts/yosemite-san-francisco.nix {})
    ];
  };

  hardware = {
    enableAllFirmware = true;
    pulseaudio.enable = true;
    u2f.enable = true;
  };

  programs = {
    ssh.startAgent = false;
  };

  #xdg.mimeApps = {
    #enable = true;
    #defaultApplications = {
      #"application/pdf" = [ "zathura.desktop" ];
      #"application/x-pdf" = [ "zathura.desktop" ];
      #"text/plain" = [ "emacs.desktop" ];
      #"text/x-script.python" = [ "emacs.desktop" ];
      #"text/x-script.sh" = [ "emacs.desktop" ];
      #"text/html" = [ "emacs.desktop" ];
      #"text/css" = [ "emacs.desktop" ];
      #"text/xml" = [ "emacs.desktop" ];
      #"x-scheme-handler/http" = [ "chromium-browser.desktop" ];
      #"x-scheme-handler/https" = [ "chromium-browser.desktop" ];
      #"x-scheme-handler/about" = [ "chromium-browser.desktop" ];
      #"x-scheme-handler/unknown" = [ "chromium-browser.desktop" ];
    #};
  #};

  services = {
    printing = {
      drivers = [ pkgs.gutenprint ];
      enable = true;
    };
   
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "terminate:ctrl_alt_bksp, ctrl:nocaps";
      displayManager.lightdm.enable = true;
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          i3status
          i3lock
          rofi
        ];
      };
      desktopManager.xfce = {
        enable = true;
        enableXfwm = false;
        noDesktop = true;
      };
    };
  };

  systemd.user.services.dropbox = {
    description = "Dropbox daemon";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.dropbox}/bin/dropbox";
      PassEnvironment = "DISPLAY";
      Restart = "always";
    };
  };
}
