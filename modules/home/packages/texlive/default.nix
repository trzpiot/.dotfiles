{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.texlive;
in
{
  options.trzpiot.packages.texlive = {
    enable = mkEnableOption "TeX Live";
  };

  config = mkIf cfg.enable {
    programs.texlive = {
      inherit (cfg) enable;

      extraPackages = tpkgs: {
        inherit (tpkgs) scheme-full;
      };
    };
  };
}
