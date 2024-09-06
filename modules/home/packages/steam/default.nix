{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (config.trzpiot.packages.steam) enable protonGe;
  inherit (lib) mkEnableOption mkIf;
  inherit (pkgs)
    mono
    proton-ge-bin
    steam
    steam-run
    ;
in
{
  options.trzpiot.packages.steam = {
    enable = mkEnableOption "Steam";
    protonGe.enable = mkEnableOption "Proton GE";
  };

  config = mkIf enable {
    home = {
      packages = [
        mono
        steam
        steam-run
      ];

      sessionVariables = mkIf protonGe.enable {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${proton-ge-bin}";
      };
    };
  };
}
