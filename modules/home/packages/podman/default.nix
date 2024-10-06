{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (builtins) attrValues;
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.podman;
in
{
  options.trzpiot.packages.podman = {
    enable = mkEnableOption "Podman";
  };

  config = mkIf cfg.enable {
    home.packages = attrValues { inherit (pkgs) podman podman-compose; };
  };
}
