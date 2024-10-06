{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.any-nix-shell;
in
{
  options.trzpiot.packages.any-nix-shell = {
    enable = mkEnableOption "any-nix-shell";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.any-nix-shell ];
  };
}
