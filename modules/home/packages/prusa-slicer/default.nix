{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.prusa-slicer;
in
{
  options.trzpiot.packages.prusa-slicer = {
    enable = mkEnableOption "PrusaSlicer";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.prusa-slicer ];
  };
}
