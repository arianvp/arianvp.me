{ config, lib, pkgs, ... }:
{
  imports =
  [ <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
  ];

  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci "virtio_blk" ];

  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/vda";
      fsType = "btrfs";
    };

  swapDevices = [ ];
  
  nix.maxJobs = 1;
}
