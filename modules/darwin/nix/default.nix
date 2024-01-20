{ config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.nix;
in
{
  options.trzpiot.nix = {
    enable = mkEnableOption "Nix";
  };

  config = mkIf cfg.enable {
    nix.package = pkgs.nixUnstable;
    services.nix-daemon.enable = true;

    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
