{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.heroic;
in
{
  options.trzpiot.packages.heroic = {
    enable = mkEnableOption "Heroic Games Launcher";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.heroic ];
  };
}
