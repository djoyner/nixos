{ config, lib, pkgs, ... }:

{
  networking.domain = "joynerhome.net";
  networking.defaultGateway = "192.168.250.1";
  networking.nameservers = [ "192.168.250.1" ];

  networking.extraHosts = ''
    192.168.250.2 tank tank.joynerhome.net
    192.168.250.3 gollum gollum.joynerhome.net
    192.168.250.4 wintermute wintermute.joynerhome.net
    192.168.250.5 imac imac.joynerhome.net
    192.168.250.6 mini mini.joynerhome.net
    192.168.250.7 htpc htpc.joynerhome.net
    192.168.250.8 xbox xbox.joynerhome.net
    192.168.250.9 plex plex.joynerhome.net
    192.168.250.10 colorlaser colorlaser.joynerhome.net
    192.168.250.91 officesw officesw.joynerhome.net
    192.168.250.92 closetsw closetsw.joynerhome.net
  '';
}
