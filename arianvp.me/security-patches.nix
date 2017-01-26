# This file can be used to modify a subtree of our nix store quickly with a security patch
# before Hydra has built it. 
# Add the CVE number as reference, such that we clearly communicate _what_ we hotpatched
# Once fixed upstream, it can be commented again,  with a link to the hydra build that fixed it
{ config, pkgs, ...}:
{
  system.replaceRuntimeDependencies = with pkgs.lib;
      # cve-20215-7547
      [
        # {original = pkgs.glibc; replacement = pkgs.stdenv.lib.overrideDerivation pkgs.glibc (oldAttr: { patches = oldAttr.patches ++
        # [(pkgs.fetchurl { url = "https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/development/libraries/glibc/cve-2015-7547.patch";
        #                  sha256 = "0awpc4rp2x27rjpj83ps0rclmn73hsgfv2xxk18k82w4hdxqpp5r";})];
        # });}
      ];
}
