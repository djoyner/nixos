{ config, pkgs, ... }:

{
  networking.hostName = "nixos"; # Define your hostname.

  imports =
    [ # Devices
      ./devices/wintermute.nix

      # Roles
      ./roles/common.nix
      ./roles/workstation.nix

      # Users
      ./users/djoyner.nix
    ];
}
