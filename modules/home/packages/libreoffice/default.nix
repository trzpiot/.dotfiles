{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.trzpiot.packages.firefox) enable;
  inherit (pkgs) libreoffice-fresh;
in
{
  options.trzpiot.packages.libreoffice = {
    enable = mkEnableOption "LibreOffice";
  };

  config = mkIf enable {
    home.packages = [ libreoffice-fresh ];
  };
}
