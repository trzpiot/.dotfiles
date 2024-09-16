{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.gimp;
in
{
  options.trzpiot.packages.gimp = {
    enable = mkEnableOption "GIMP";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.gimp ];
  };
}
