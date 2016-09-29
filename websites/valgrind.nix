{ config, pkgs, ...}:
{
  services.nginx.httpConfig = ''
  server {
    location / {
      root "${pkgs.valgrind.doc}/share/doc/valgrind/html"
    }
  }
  '';
}
