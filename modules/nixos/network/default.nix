{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.network;
in
{
  options.trzpiot.network = {
    enable = mkEnableOption "Network";
  };

  config = mkIf cfg.enable {
    networking = {
      dhcpcd.enable = false;

      networkmanager = {
        enable = true;
        wifi = {
          backend = "iwd";
          powersave = false;
        };
      };
    };
  };
}
