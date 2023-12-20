{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.spotify;
in
{
  options.trzpiot.packages.spotify = {
    enable = mkEnableOption "Spotify";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.spotify ];
  };
}
