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
      dhcpcd = {
        inherit (cfg) enable;
      };

      networkmanager = {
        inherit (cfg) enable;

        wifi = {
          backend = "iwd";
          powersave = false;
        };
      };
    };
  };
}
