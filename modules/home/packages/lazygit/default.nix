{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.lazygit;
in
{
  options.trzpiot.packages.lazygit = {
    enable = mkEnableOption "Lazygit";
  };

  config = mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
      settings.git.paging.pager = "delta --syntax-theme 'Dracula' --paging=never";
    };
  };
}
