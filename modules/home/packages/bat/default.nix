{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.bat;
in
{
  options.trzpiot.packages.bat = {
    enable = mkEnableOption "bat";
  };

  config = mkIf cfg.enable {
    programs.bat = {
      inherit (cfg) enable;

      config.theme = "Dracula";
    };
  };
}
