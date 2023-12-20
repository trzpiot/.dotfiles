{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.dconf-editor;
in
{
  options.trzpiot.packages.dconf-editor = {
    enable = mkEnableOption "Dconf Editor";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.gnome.dconf-editor ];
  };
}
