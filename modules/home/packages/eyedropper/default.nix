{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.eyedropper;
in
{
  options.trzpiot.packages.eyedropper = {
    enable = mkEnableOption "Eyedropper";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.eyedropper ];
  };
}
