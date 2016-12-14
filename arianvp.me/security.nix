{ config, pkgs, ...}:
{
  security.sudo.wheelNeedsPassword = false;
  services.openssh.passwordAuthentication = false;
  networking.firewall.allowedTCPPorts = [ 80 22 443];
  networking.firewall.allowPing = true;
}
