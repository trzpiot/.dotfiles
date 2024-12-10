{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.gaming;
in
{
  options.trzpiot.gaming = {
    enable = mkEnableOption "Gaming";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = builtins.attrValues { inherit (pkgs) mono; };

    programs = {
      gamemode = {
        inherit (cfg) enable;
      };

      steam = {
        inherit (cfg) enable;

        extraCompatPackages = [ pkgs.proton-ge-bin ];
      };
    };

    # Required for some games, e.g. DayZ
    boot.kernel.sysctl."vm.max_map_count" = 1048576;
  };
}
