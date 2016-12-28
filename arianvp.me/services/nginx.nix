{ config, pkgs, ...}:
{
  /* Fuck the NSA, we use our own DH param, and it's 2048 bits */
  deployment.keys."dhparam.pem" = {
    user = "nginx";
    group = "nginx";
    text = builtins.readFile ../../keys/dhparam.pem;
  };
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    sslDhparam = "/run/keys/dhparam.pem";
    virtualHosts = {
      "arianvp.me" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          root = "/var/www/arianvp.me";
          index = "index.html";
        };
      };
    };
  };
}
