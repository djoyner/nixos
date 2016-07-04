{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/New_York";
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    cacert
    curl
    git
    htop
    inetutils
    telnet
    tmux
    vim
    wget
    unzip
  ];

  programs.bash.enableCompletion = true;
  programs.ssh.startAgent = false;

  security.sudo.wheelNeedsPassword = false;

  services.openssh.enable = true;
}
