{pkgs, config, ...}:

let
  domain = "chat.arianvp.me";
  proxyPass = "http://127.0.0.1${config.services.mattermost.listenAddress}";

in
{
  imports = [ ../modules/mattermost.nix ];
  services.mattermost2 = {
    enable = true;
    siteUrl = "https://${domain}";
    mutableConfig = true;
  };

  /*deployment.keys."htpasswd" = {
    text = builtins.readFile ../../keys/htpasswd;
    user = config.services.nginx.user;
    group = config.services.nginx.group;
  };*/

  services.nginx.virtualHosts."${domain}" = {
    enableACME = true;
    forceSSL = true;

    /*extraConfig = ''
    auth_basic secured;
    auth_basic_user_file /var/cache/nginx/htpasswd;
    '';*/

    locations."/" = {
      proxyPass = proxyPass;
    };

    /* upgrade websocket connections */
    locations."/api/v3/users/websocket" = {
      proxyPass = proxyPass;
      extraConfig = ''
       proxy_set_header Upgrade $http_upgrade;
       proxy_set_header Connection "upgrade";
       client_max_body_size 50M;
       proxy_set_header Host $http_host;
       proxy_set_header X-Real-IP $remote_addr;
       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header X-Forwarded-Proto $scheme;
       proxy_set_header X-Frame-Options SAMEORIGIN;
       proxy_buffers 256 16k;
       proxy_buffer_size 16k;
       proxy_read_timeout 600s;
      '';
    };
  };

}
