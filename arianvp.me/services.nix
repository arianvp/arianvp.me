{ config, pkgs, ...}:
{
  imports =
    [ ./services/irc.nix
      ./services/nginx.nix
      ./services/openssh.nix
  /*    ./services/gitlab.nix*/
    ];
}
