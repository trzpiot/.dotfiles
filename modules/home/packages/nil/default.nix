{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.nil;
in
{
  options.trzpiot.packages.nil = {
    enable = mkEnableOption "nil";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.nil ];
  };
}
