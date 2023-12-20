{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.delta;
in
{
  options.trzpiot.packages.delta = {
    enable = mkEnableOption "Delta";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.delta ];
  };
}
