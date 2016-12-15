{ pkgs, config, ...}:
{
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };
}
