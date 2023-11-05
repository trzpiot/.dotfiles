{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.atkinson-hyperlegible;
in
{
  options.trzpiot.packages.atkinson-hyperlegible = {
    enable = mkEnableOption "Atkinson Hyperlegible";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.atkinson-hyperlegible ];
  };
}
