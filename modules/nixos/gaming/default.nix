{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (pkgs) mono proton-ge-bin steam-run;

  cfg = config.trzpiot.gaming;
in
{
  options.trzpiot.gaming = {
    enable = mkEnableOption "Gaming";
  };

  config = mkIf cfg.enable {
    packages = [
      mono
      steam-run
    ];

    programs.gamemode.enable = true;

    programs.steam = {
      enable = true;
      extraCompatPackages = [ proton-ge-bin ];
    };

    # Required for some games, e.g. DayZ
    boot.kernel.sysctl."vm.max_map_count" = 1048576;
  };
}
