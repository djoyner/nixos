{ config, pkgs, ... }:

{
  imports =
    [ # Devices
      ./devices/wintermute.nix

      # Roles
      ./roles/common.nix
      ./roles/joynerhome.nix
      ./roles/workstation.nix

      # Users
      ./users/djoyner.nix
    ];
}
