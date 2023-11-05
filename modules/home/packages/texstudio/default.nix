{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.texstudio;
in
{
  options.trzpiot.packages.texstudio = {
    enable = mkEnableOption "TeXstudio";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.texstudio ];
  };
}
