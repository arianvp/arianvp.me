{
  "arianvp.me" =
  { pkgs, config, ...}:
  {

    imports = [
      ./arianvp.me/configuration.nix
    ];
    deployment.targetHost = "arianvp.me";

    /* Fuck the NSA, we use our own DH param, and it's 2048 bits */
    deployment.keys."dhparam.pem" = {
      user = "nginx";
      group = "nginx";
      text = builtins.readFile ./keys/dhparam.pem;
    };

  };
}
