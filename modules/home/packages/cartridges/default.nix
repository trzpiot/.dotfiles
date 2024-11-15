{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.cartridges;
in
{
  options.trzpiot.packages.cartridges = {
    enable = mkEnableOption "Cartridges";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.cartridges ];
  };
}
