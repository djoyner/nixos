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
    keepassx
    openvpn
    termite
    transmission_gtk
    vlc
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
  };

  programs = {
    ssh.startAgent = false;
  };

  services = {
    printing = {
      drivers = [ pkgs.gutenprint ];
      enable = true;
    };
   
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "ctrl:nocaps";
      windowManager.i3.enable = true;
      windowManager.i3.extraPackages = with pkgs; [
        i3status
        i3lock
        rofi
      ];
      displayManager.lightdm.enable = true;
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

  virtualisation.docker = {
    enable = true;
    listenOptions = [
      "0.0.0.0:2375"
      "/var/run/docker.sock"
    ];
  };
}
