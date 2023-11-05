{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.gnome-extensions.paperwm;
in
{
  options.trzpiot.packages.gnome-extensions.paperwm = {
    enable = mkEnableOption "PaperWM";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.gnomeExtensions.paperwm ];
  };
}
