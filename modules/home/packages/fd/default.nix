{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.fd;
in
{
  options.trzpiot.packages.fd = {
    enable = mkEnableOption "fd";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.fd ];
  };
}
