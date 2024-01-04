{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.inkscape;
in
{
  options.trzpiot.packages.inkscape = {
    enable = mkEnableOption "Inkscape";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.inkscape ];
  };
}
