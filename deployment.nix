{
  "arianvp.me" =
  { pkgs, config, ...}:
  {

    imports = [
      ./arianvp.me/configuration.nix
    ];
    deployment.targetHost = "arianvp.me";


  };
}
