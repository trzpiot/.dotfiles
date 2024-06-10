{ config, pkgs, lib, ... }:

let
  inherit (config.trzpiot.packages.steam) enable protonGeCustom;
  inherit (lib) mkEnableOption mkIf optionals;
  inherit (pkgs) mono steam steam-run;
  inherit (pkgs.trzpiot) proton-ge-custom;
in
{
  options.trzpiot.packages.steam = {
    enable = mkEnableOption "Steam";
    protonGeCustom.enable = mkEnableOption "proton-ge-custom";
  };

  config = mkIf enable {
    home = {
      packages = [ mono steam steam-run ] ++ optionals protonGeCustom.enable [ proton-ge-custom ];

      sessionVariables = mkIf protonGeCustom.enable {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${proton-ge-custom}";
      };
    };
  };
}
