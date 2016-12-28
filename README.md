# Introduction

This document describes how to deploy http://arianvp.me


## Bootstrapping a server

1. Create a server on https://vultr.com/ using the following
ISO image:

https://d3g5gsiof5omrk.cloudfront.net/nixos/16.09/nixos-16.09.1229.f52eaf4/nixos-minimal-16.09.1229.f52eaf4-x86_64-linux.iso


2. Go through the installation process using the NixOS manual

3. Change configuration.nix to contain the following lines:

```nix
{
  users.extraUsers.root = {
    openssh.authorizedKeys.keys =
      [
      $YOUR_KEY_HERE_USED_FOR_DEPLOYMENT
      ];
  };
  services.openssh.enable = true;
}
```

4. Point DNS of `arianvp.me` to the newly created server


## Installing Nixops

### On Arch Linux
```
$ pacaur -S nix
$ useradd nixbld
$ usermod -aG nixbld nixbld
$ systemctl enable nix-daemon.socket
$ source /etc/profile.d/nix.sh
$ nix-env -i nixops
$ nix-channel --add https://nixos.org/channels/nixos-unstable-small nixos-unstable
$ nix-channel --update
```

### On NixOS
```
$ nix-env -i nixops
```


## Creating a deployment

```
$ nixops create -I $HOME/.nix-defexpr/channels/nixos deployment.nix
```


## Provisioning

We can now provision `arianvp.me` with the following command:

```
$ nixops deploy -I $HOME/.nix-defexpr/channels/nixos-unstable
```


## Updating

Change any of the `*.nix` files to suit your needs and simply type

```
$ nixops deploy
```

