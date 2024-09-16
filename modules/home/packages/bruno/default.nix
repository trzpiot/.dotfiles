{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.bruno;
in
{
  options.trzpiot.packages.bruno = {
    enable = mkEnableOption "Bruno";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.bruno ];
  };
}
