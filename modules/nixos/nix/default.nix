{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.nix;
in
{
  options.trzpiot.nix = {
    enable = mkEnableOption "Nix";
  };

  config = mkIf cfg.enable {

    nix = {
      package = pkgs.nixVersions.latest;
      settings.experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
