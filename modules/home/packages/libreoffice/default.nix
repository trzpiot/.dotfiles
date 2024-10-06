{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.libreoffice;
in
{
  options.trzpiot.packages.libreoffice = {
    enable = mkEnableOption "LibreOffice";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.libreoffice-fresh ];
  };
}
