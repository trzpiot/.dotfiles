{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.todoist;
in
{
  options.trzpiot.packages.todoist = {
    enable = mkEnableOption "Todoist";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.todoist-electron ];
  };
}
