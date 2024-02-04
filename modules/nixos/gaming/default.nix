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

    # Required for some games, e.g. DayZ
    boot.kernel.sysctl."vm.max_map_count" = 1048576;
  };
}
