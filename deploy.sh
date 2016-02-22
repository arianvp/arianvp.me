#! /bin/sh
cp ./config/*.nix /etc/nixos
nixos-rebuild switch
