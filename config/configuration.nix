{ config, pkgs, ...}:
{
  imports =
    [
      ./hardware-configuration.nix
      ./grub.nix
      ./users.nix
      ./services.nix
    ];
}
