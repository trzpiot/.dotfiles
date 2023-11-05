{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.gnome-extensions.appindicator;
in
{
  options.trzpiot.packages.gnome-extensions.appindicator = {
    enable = mkEnableOption "AppIndicator";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.gnomeExtensions.appindicator ];
  };
}
