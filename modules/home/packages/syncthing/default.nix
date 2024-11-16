{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (pkgs.stdenv) isLinux;

  cfg = config.trzpiot.packages.syncthing;
in
{
  options.trzpiot.packages.syncthing = {
    enable = mkEnableOption "Syncthing";
  };

  config = mkIf cfg.enable {
    services.syncthing = {
      inherit (cfg) enable;

      tray.enable = isLinux;
    };
  };
}
