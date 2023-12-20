{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.gaming;
in
{
  options.trzpiot.gaming = {
    enable = mkEnableOption "Gaming";
  };

  config = mkIf cfg.enable {
    programs.gamemode.enable = true;
  };
}
