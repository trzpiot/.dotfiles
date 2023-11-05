{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.nixpkgs-fmt;
in
{
  options.trzpiot.packages.nixpkgs-fmt = {
    enable = mkEnableOption "nixpkgs-fmt";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.nixpkgs-fmt ];
  };
}
