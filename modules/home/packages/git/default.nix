{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.packages.git;
in
{
  options.trzpiot.packages.git = {
    enable = mkEnableOption "Git";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "Sebastian Gabriel Trzpiot";
      userEmail = "mail@trzpiot.de";
      extraConfig.init.defaultBranch = "main";
    };
  };
}
