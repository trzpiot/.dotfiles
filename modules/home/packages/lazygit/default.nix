{ config, lib, ... }:

let
  inherit (lib) importJSON mkEnableOption mkIf;

  cfg = config.trzpiot.packages.lazygit;
in
{
  options.trzpiot.packages.lazygit = {
    enable = mkEnableOption "Lazygit";
  };

  config = mkIf cfg.enable {
    programs.lazygit = {
      inherit (cfg) enable;

      settings = {
        gui = importJSON ./dracula.json;
        git.paging.pager = "delta --dark --syntax-theme 'Dracula' --paging=never";
      };
    };
  };
}
