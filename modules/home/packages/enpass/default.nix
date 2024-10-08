{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.enpass;
in
{
  options.trzpiot.packages.enpass = {
    enable = mkEnableOption "Enpass";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.enpass ];
  };
}
