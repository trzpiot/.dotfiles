{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.podman;
in
{
  options.trzpiot.packages.podman = {
    enable = mkEnableOption "podman";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.podman ];
  };
}
