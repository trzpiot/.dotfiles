{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.direnv;
in
{
  options.trzpiot.packages.direnv = {
    enable = mkEnableOption "direnv";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      inherit (cfg) enable;

      nix-direnv = {
        inherit (cfg) enable;
      };
    };
  };
}
