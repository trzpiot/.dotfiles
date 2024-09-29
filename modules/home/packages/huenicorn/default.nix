{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (pkgs.trzpiot) huenicorn;

  cfg = config.trzpiot.packages.huenicorn;
in
{
  options.trzpiot.packages.huenicorn = {
    enable = mkEnableOption "Huenicorn";
  };

  config = mkIf cfg.enable {
    home = {
      packages = [ huenicorn ];
    };
  };
}
