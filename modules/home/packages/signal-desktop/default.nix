{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.signal-desktop;
in
{
  options.trzpiot.packages.signal-desktop = {
    enable = mkEnableOption "Signal";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.signal-desktop ];
  };
}
