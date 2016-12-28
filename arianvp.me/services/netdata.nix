{pkgs, config, ...}:
{
  imports = [ ../modules/netdata.nix ];


  services.netdata = {
    enable = true;
    port = 19999;
  };


  /* TODO: Fuck this is not supported in the latest
   * version of nixops yet
   */
  /*systemd.services.after-htpasswd = {
    description = "Executed after htpasswd is present";
    bindsTo = ["htpasswd-key.service"];
    preStart =
    ''
    mkdir -p /var/cache/nginx
    chmod 700 /var/cache/nginx
    chown -R ${config.services.nginx.user}:${config.services.nginx.group} /var/cache/nginx
    '';
    serviceConfig = {
      ExecStart = "/usr/bin/cp /run/keys/htpasswd /var/cache/nginx/htpasswd";
      ExecStop = "/usr/bin/rm /var/cache/nginx/htpasswd";
    };
  };*/

  /*deployment.keys."htpasswd" = {
    text = builtins.readFile ../../keys/htpasswd;
    user = config.services.nginx.user;
    group = config.services.nginx.group;
  };*/

  /*services.nginx.virtualHosts."netdata.arianvp.me" = {
    enableACME = true;
    forceSSL = true;

    extraConfig = ''
    auth_basic secured;
    auth_basic_user_file /var/cache/nginx/htpasswd;
    '';
    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString config.services.netdata.port}";
    };
  };*/

}
