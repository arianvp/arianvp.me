#! /bin/sh
cp ./deploy/*.nix /etc/nixos
nixos-rebuild switch
