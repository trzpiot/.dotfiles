{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (config.trzpiot.packages.steam) enable;
  inherit (lib) mkEnableOption mkIf;
  inherit (pkgs.trzpiot) huenicorn;
in
{
  options.trzpiot.packages.huenicorn = {
    enable = mkEnableOption "Huenicorn";
  };

  config = mkIf enable {
    home = {
      packages = [ huenicorn ];
    };
  };
}
