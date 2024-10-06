{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.huenicorn;
in
{
  options.trzpiot.packages.huenicorn = {
    enable = mkEnableOption "Huenicorn";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.trzpiot.huenicorn ];
  };
}
