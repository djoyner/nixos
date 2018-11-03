{ config, lib, pkgs, ... }:

{
  imports = 
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "sr_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.extraModprobeConfig = ''
    options snd slots=snd-hda-intel
  '';


  fileSystems."/" =
    { device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 8;

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "wintermute.joynerhome.net";
  networking.interfaces.eno1.ipv4.addresses =
    [
      {
        address = "192.168.250.4";
        prefixLength = 24;
      }
    ];

  environment.systemPackages = with pkgs; [ cifs-utils ];

  services = {
    printing.drivers = [ pkgs.gutenprint ];
  };
}
