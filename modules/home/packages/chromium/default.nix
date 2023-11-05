{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.chromium;
in
{
  options.trzpiot.packages.chromium = {
    enable = mkEnableOption "Chromium";
  };

  config = mkIf cfg.enable {
    programs.chromium.enable = true;
  };
}
