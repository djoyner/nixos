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
    jq
    lsof
    man
    mosh
    nix-repl
    openssl
    pciutils
    pv
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

  networking.firewall.enable = false;

  programs.bash.enableCompletion = true;

  security.sudo.wheelNeedsPassword = false;

  services.openssh.enable = true;

  time.timeZone = "America/New_York";
}
