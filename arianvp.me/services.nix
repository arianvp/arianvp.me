{ config, pkgs, ...}:
{
  imports =
    [ ./services/irc.nix
    ];
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "arianvp.me" = {
        locations."/" = {
          root = "/var/www/arianvp.me";
          index = "index.html";
        };
      };
    };
  };

}
