{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (builtins) attrValues;
  inherit (lib) mkEnableOption mkIf;
  inherit (pkgs) gnomeExtensions;

  cfg = config.trzpiot.packages.gnome;
in
{
  options.trzpiot.packages.gnome = {
    enable = mkEnableOption "GNOME";
  };

  config = mkIf cfg.enable {
    dconf.settings = {
      "org/gnome/mutter" = {
        experimental-features = [ "scale-monitor-framebuffer" ];
      };
    };

    home.packages = attrValues {
      inherit (gnomeExtensions)
        appindicator
        paperwm
        ;
    };
  };
}
