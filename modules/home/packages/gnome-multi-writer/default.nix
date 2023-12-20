{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.gnome-multi-writer;
in
{
  options.trzpiot.packages.gnome-multi-writer = {
    enable = mkEnableOption "GNOME MultiWriter";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.gnome-multi-writer ];
  };
}
