{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.vfkit;
in
{
  options.trzpiot.packages.vfkit = {
    enable = mkEnableOption "vfkit";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.vfkit ];
  };
}
