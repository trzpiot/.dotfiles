{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.eza;
in
{
  options.trzpiot.packages.eza = {
    enable = mkEnableOption "eza";
  };

  config = mkIf cfg.enable {
    programs.eza = {
      enable = true;
      enableAliases = true;
      git = true;
    };
  };
}
