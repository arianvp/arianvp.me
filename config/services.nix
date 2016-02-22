{ config, pkgs, ...}:
{
  imports = 
    [ ./services/irc.nix
      ./websites/valgrind.nix
    ];
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };

  services.ngnix.enable = true;
}
