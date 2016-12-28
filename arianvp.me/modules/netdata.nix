{config, lib, pkgs, ...}:

with lib;

let
  cfg = config.services.netdata;
  /* for now, netdata config is just empty, to use the default settings */
  configFile = pkgs.writeText "netdata.conf" ''
  # We are currently empty
  '';
in
{
  options = {
    services.netdata = {
      enable = mkEnableOption "Netdata";

      port = mkOption {
        default = 19999;
        type = types.int;
        description = "
          The port on which netdata should listen.
        ";
      };

      user = mkOption {
        type = types.str;
        default = "netdata";
        description = "User account under which netdata runs.";
      };

      group = mkOption {
        type = types.str;
        default = "netdata";
        description = "Group account under which netdata runs.";
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.netdata = {
      description = "Netdata";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      preStart =
      ''
      mkdir -p /var/cache/netdata
      chmod 700 /var/cache/netdata
      chown -R ${cfg.user}:${cfg.group} /var/cache/netdata
      mkdir -p /var/lib/netdata
      chmod 700 /var/lib/netdata
      chown -R ${cfg.user}:${cfg.group} /var/lib/netdata
      mkdir -p /var/log/netdata
      chmod 700 /var/log/netdata
      chown -R ${cfg.user}:${cfg.group} /var/log/netdata
      '';
      serviceConfig = {
        ExecStart = "${pkgs.netdata}/bin/netdata -u ${cfg.user} -D -p ${toString cfg.port} -c ${configFile}";
      };
    }
    ;

    /* Not sure if this is correct */
    users.extraUsers = optionalAttrs (cfg.user == "netdata") (singleton
      { name = "netdata";
        group = cfg.group;
      });

    users.extraGroups = optionalAttrs (cfg.group == "netdata") (singleton
      { name = "netdata";
      });
  };
}
