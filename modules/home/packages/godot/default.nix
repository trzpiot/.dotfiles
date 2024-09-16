{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.godot;
in
{
  options.trzpiot.packages.godot = {
    enable = mkEnableOption "Godot";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.godot_4 ];
  };
}
