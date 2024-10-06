{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.security;
in
{
  options.trzpiot.security = {
    enable = mkEnableOption "Security";
  };

  config = mkIf cfg.enable {
    security.rtkit = {
      inherit (cfg) enable;
    };
  };
}
