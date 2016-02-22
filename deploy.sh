#! /bin/sh
cp -R ./config/*.nix /etc/nixos
nixos-rebuild switch
