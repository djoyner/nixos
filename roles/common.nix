{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    bash
    cacert
    curl
    git
    htop
    inetutils
    lsof
    man
    mosh
    sudo
    telnet
    vim
    wget
    unrar
    unzip
    zip
  ];

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  programs.bash.enableCompletion = true;
  programs.ssh.startAgent = false;

  security.sudo.wheelNeedsPassword = false;

  services.openssh.enable = true;

  time.timeZone = "America/New_York";
}
