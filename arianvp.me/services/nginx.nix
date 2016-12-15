{ config, pkgs, ...}:
{
  nixpkgs.config.packageOverrides = pkgs: rec { simp_le = pkgs.callPackage ../../nixpkgs/pkgs/tools/admin/simp_le {}; };
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
