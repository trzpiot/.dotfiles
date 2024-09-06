{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.nixfmt;
in
{
  options.trzpiot.packages.nixfmt = {
    enable = mkEnableOption "nixfmt";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.nixfmt-rfc-style ];
  };
}
