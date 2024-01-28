{ config, lib, ... }:

let
  inherit (config.trzpiot.packages.git) enable userName userEmail;
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.trzpiot) mkStrOption;
in
{
  options.trzpiot.packages.git = {
    enable = mkEnableOption "Git";
    userName = mkStrOption null "The full name of the user.";
    userEmail = mkStrOption null "The e-mail address of the user.";
  };

  config = mkIf enable {
    programs.git = {
      inherit enable userName userEmail;

      extraConfig = {
        core.whitespace = "trailing-space,space-before-tab";
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };
  };
}
