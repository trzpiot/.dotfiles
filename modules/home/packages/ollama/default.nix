{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.ollama;
in
{
  options.trzpiot.packages.ollama = {
    enable = mkEnableOption "Ollama";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.ollama ];
  };
}
