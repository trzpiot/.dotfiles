{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.idea-community;
in
{
  options.trzpiot.packages.idea-community = {
    enable = mkEnableOption "IntelliJ IDEA Community Edition";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.jetbrains.idea-community ];
  };
}
