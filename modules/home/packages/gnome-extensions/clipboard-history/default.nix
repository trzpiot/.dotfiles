{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.gnome-extensions.clipboard-history;
in
{
  options.trzpiot.packages.gnome-extensions.clipboard-history = {
    enable = mkEnableOption "Clipboard History";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.gnomeExtensions.clipboard-history ];
  };
}
