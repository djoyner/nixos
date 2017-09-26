{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aspell
    aspellDicts.en
    chromium
    dropbox
    emacs
    keepassx
    openvpn
    transmission_gtk
    vlc
  ];

  #services.gnome3 = {
  #  gnome-keyring.enable = true;
  #  sushi.enable = true;
  #};

  services.printing = {
    drivers = [ pkgs.gutenprint ];
    enable = true;
  };

  services.xserver = {
    enable = true;
    layout = "us";
    desktopManager.plasma5.enable = true;
    displayManager.sddm.enable = true;
  };

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
    ];
  };

  virtualisation.docker = {
    enable = true;
    listenOptions = [
      "0.0.0.0:2375"
      "/var/run/docker.sock"
    ];
  };
}
