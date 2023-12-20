{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.aseprite;
in
{
  options.trzpiot.packages.aseprite = {
    enable = mkEnableOption "Aseprite";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.aseprite ];
  };
}
