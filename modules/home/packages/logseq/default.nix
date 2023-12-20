{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.logseq;
in
{
  options.trzpiot.packages.logseq = {
    enable = mkEnableOption "Logseq";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.logseq ];
  };
}
