{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.inter;
in
{
  options.trzpiot.packages.inter = {
    enable = mkEnableOption "Inter";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.inter ];
  };
}
