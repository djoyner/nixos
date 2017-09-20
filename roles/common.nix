{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    acpi
    bash
    bind
    cacert
    coreutils
    curl
    file
    git
    htop
    hwinfo
    inetutils
    lsof
    man
    mosh
    openssl
    pciutils
    strace
    sudo
    telnet
    tmux
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
