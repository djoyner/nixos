{ config, pkgs, ... }:

{
  imports =
    [ # Devices
      ./devices/vmware.nix

      # Roles
      ./roles/common.nix
      ./roles/dockerd.nix

      # Users
      ./users/djoyner.nix
    ];
}
