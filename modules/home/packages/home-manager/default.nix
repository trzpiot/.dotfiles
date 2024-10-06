{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.trzpiot) mkStrOption;
  inherit (pkgs.stdenv) isDarwin;

  cfg = config.trzpiot.packages.home-manager;
in
{
  options.trzpiot.packages.home-manager = {
    enable = mkEnableOption "home-manager";
    username = mkStrOption null "The name of the user account.";
    homeDirectory = mkStrOption null "The home directory of the user.";
    name = mkStrOption null "The full name of the user.";
    email = mkStrOption null "The e-mail address of the user.";
  };

  config = mkIf cfg.enable {
    programs.home-manager = {
      inherit (cfg) enable;
    };

    home = {
      inherit (cfg) username;

      stateVersion = "23.05";

      homeDirectory =
        if cfg.homeDirectory != null then
          cfg.homeDirectory
        else if isDarwin then
          "/Users/${cfg.username}"
        else
          "/home/${cfg.username}";
    };
  };
}
