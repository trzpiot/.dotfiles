{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.docker;
in
{
  options.trzpiot.docker = {
    enable = mkEnableOption "Docker";
  };

  config = mkIf cfg.enable {
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
