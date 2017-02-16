{pkgs, config, ...}:
{
  imports = [ ../modules/netdata.nix ];

  services.netdata = {
    enable = false;
    port = 19999;
  };

}
