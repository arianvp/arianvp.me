#! /bin/sh
cp -R ./config/* /etc/nixos
nixos-rebuild switch
