{ config, pkgs, ...}:
{
  imports =
    [
      ./hardware-configuration.nix
      ./grub.nix
      ./users.nix
      ./services.nix
      ./security-patches.nix
      ./security.nix
    ];
}
