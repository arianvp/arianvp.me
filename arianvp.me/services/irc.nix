{ config, pkgs, lib, ...}:
{
  systemd.services.ircSession = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "forking";
      User = "nixos";
      ExecStart = ''${pkgs.tmux}/bin/tmux new-session -d -s irc -n irc ${pkgs.weechat}/bin/weechat'';
      ExecStop = ''${pkgs.tmux}/bin/tmux kill-session -t irc'';
    };
  };

  environment.systemPackages = [ pkgs.tmux ];
}
