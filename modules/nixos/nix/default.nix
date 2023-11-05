{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.nix;
in
{
  options.trzpiot.nix = {
    enable = mkEnableOption "Nix";
  };

  config = mkIf cfg.enable {
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substitute = true;
      substituters = [ "https://cache.nixos.org/" ];
      trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
      trusted-users = [ "root" "sebastian" ];
    };
  };
}
