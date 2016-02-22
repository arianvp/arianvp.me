{ config, pkgs, ...}:
{
  imports = [ ./services/irc.nix ];
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };
}
