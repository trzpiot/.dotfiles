{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.zoxide;
in
{
  options.trzpiot.packages.zoxide = {
    enable = mkEnableOption "zoxide";
  };

  config = mkIf cfg.enable {
    programs.zoxide = {
      inherit (cfg) enable;

      options = [
        "--cmd cd"
      ];
    };
  };
}
