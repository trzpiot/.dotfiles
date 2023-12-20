{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.dircolors;
in
{
  options.trzpiot.packages.dircolors = {
    enable = mkEnableOption "dircolors";
  };

  config = mkIf cfg.enable {
    home.file.dircolors = {
      source = ./.dircolors;
      target = ".dircolors";
    };

    programs.dircolors = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
