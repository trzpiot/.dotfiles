{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.r2modman;
in
{
  options.trzpiot.packages.r2modman = {
    enable = mkEnableOption "r2modman";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.r2modman ];
  };
}
