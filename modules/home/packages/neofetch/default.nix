{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.neofetch;
in
{
  options.trzpiot.packages.neofetch = {
    enable = mkEnableOption "neofetch";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.neofetch ];
  };
}
