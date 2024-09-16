{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.teamspeak;
in
{
  options.trzpiot.packages.teamspeak = {
    enable = mkEnableOption "TeamSpeak";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.teamspeak_client ];
  };
}
