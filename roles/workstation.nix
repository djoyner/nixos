{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    acpi
    chromium
    dropbox
    emacs
    keepassx
    openvpn
    transmission
    unifi
    vlc
  ];

  services.printing.enable = true;

  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.gdm.enable = true;
    desktopManager.gnome3.enable = true;
    startGnuPGAgent = true;
  };

  services.unifi.enable = true;

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      dejavu_fonts
      meslo-lg
      ubuntu_font_family
    ];
  };

  virtualisation.docker.enable = true;
}
