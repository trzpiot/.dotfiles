{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.trzpiot) mkStrOption;

  cfg = config.trzpiot.packages.git;
in
{
  options.trzpiot.packages.git = {
    enable = mkEnableOption "Git";
    name = mkStrOption null "The full name of the user.";
    email = mkStrOption null "The e-mail address of the user.";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = cfg.name;
      userEmail = cfg.email;
      extraConfig.init.defaultBranch = "main";
    };
  };
}
