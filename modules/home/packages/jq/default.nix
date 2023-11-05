{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.jq;
in
{
  options.trzpiot.packages.jq = {
    enable = mkEnableOption "jq";
  };

  config = mkIf cfg.enable {
    programs.jq.enable = true;
  };
}
