{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    listenOptions = [
      "0.0.0.0:2375"
      "/var/run/docker.sock"
    ];
  };
}
