{pkgs, config, ...}:
{
  /* provision secrets */
  deployment.keys = {
    "gitlab/passwords/db" = {
      user = "git";
      group = "git";
      text = builtins.readFile ../../keys/gitlab/passwords/db;
    };
    "gitlab/passwords/root" = {
      user = "git";
      group = "git";
      text = builtins.readFile ../../keys/gitlab/passwords/root;
    };
    "/run/keys/gitlab/secrets/otp" = {
      user = "git";
      group = "git";
      text = builtins.readFile ../../keys/gitlab/secrets/otp;
    };
    "/run/keys/gitlab/secrets/db" = {
      user = "git";
      group = "git";
      text = builtins.readFile ../../keys/gitlab/secrets/db;
    };
    "/run/keys/gitlab/secrets/secret" = {
      user = "git";
      group = "git";
      text = builtins.readFile ../../keys/gitlab/secrets/secret;
    };
  };

  services.gitlab = {
    enable = true;
    databasePassword = builtins.readFile /run/keys/gitlab/passwords/db;
    initialRootPassword = builtins.readFile /run/keys/gitlab/passwords/root;
    secrets = {
      otp = builtins.readFile /run/keys/gitlab/secrets/otp;
      db = builtins.readFile /run/keys/gitlab/secrets/db;
      secret = builtins.readFile /run/keys/gitlab/secrets/secret;
    };
    user = "git";
    group = "git";
  };

  nginx.virtualHosts."gitlab.arianvp.me" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://unix:/run/gitlab/gitlab-workhorse.socket";
    };
  };
}
