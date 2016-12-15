{ config, pkgs, ...}:
{
  nixpkgs.config.packageOverrides = pkgs: rec { simple_le = pkgs.callPackage ../../nixpkgs/pkgs/tools/admin/simple_le {}; };
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "arianvp.me" = {
        enableACME = false;
        forceSSL = false;
        locations."/" = {
          root = "/var/www/arianvp.me";
          index = "index.html";
        };
      };
    };
  };
}
