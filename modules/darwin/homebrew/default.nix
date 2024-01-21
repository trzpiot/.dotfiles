{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.homebrew;
in
{
  options.trzpiot.homebrew = {
    enable = mkEnableOption "Homebrew";
  };

  config = mkIf cfg.enable {
    homebrew = {
      enable = true;

      global = {
        autoUpdate = false;
      };

      onActivation = {
        autoUpdate = true;
        cleanup = "zap";
        upgrade = true;
      };

      casks = [
        # TODO: Not available in Nixpkgs for aarch64-darwin
        "orcaslicer"

        # TODO: Outdated in Nixpkgs for aarch64-darwin
        "spotify"
      ];
    };
  };
}
