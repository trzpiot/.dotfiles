{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.gnome-boxes;
in
{
  options.trzpiot.packages.gnome-boxes = {
    enable = mkEnableOption "GNOME Boxes";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.gnome.gnome-boxes ];
  };
}
