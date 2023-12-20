{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.steam;
in
{
  options.trzpiot.packages.steam = {
    enable = mkEnableOption "Steam";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.steam ];
  };
}
