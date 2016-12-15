{ config, pkgs, ...}:
{
  nix.gc = {
    automatic = true;
    dates = "03:00";
  };
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
