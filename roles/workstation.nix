{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    acpi
    aspell
    aspellDicts.en
    bind
    dropbox
    emacs
    google-chrome
    hwinfo
    keepassx
    openvpn
    pciutils
    strace
    tmux
    transmission_gtk
    vlc
  ];

  #services.gnome3 = {
  #  gnome-keyring.enable = true;
  #  sushi.enable = true;
  #};

  services.printing.enable = true;

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

  virtualisation.docker.enable = true;
}
