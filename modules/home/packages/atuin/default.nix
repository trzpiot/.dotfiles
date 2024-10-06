{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.atuin;
in
{
  options.trzpiot.packages.atuin = {
    enable = mkEnableOption "Atuin";
  };

  config = mkIf cfg.enable {
    programs.atuin = {
      inherit (cfg) enable;
    };
  };
}
