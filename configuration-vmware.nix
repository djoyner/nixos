{ config, pkgs, ... }:

{
  imports =
    [ # Devices
      ./devices/vmware.nix

      # Roles
      ./roles/common.nix
      ./roles/workstation.nix

      # Users
      ./users/djoyner.nix
    ];

  system.stateVersion = "17.03";
}
