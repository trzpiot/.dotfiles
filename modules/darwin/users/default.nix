{ config, pkgs, lib, ... }:

let
  inherit (builtins) any listToAttrs;
  inherit (lib) mkEnableOption mkIf mkOption;
  inherit (lib.trzpiot) mkEnumOption mkIntOption mkStrOption;
  inherit (lib.types) listOf submodule;

  cfg = config.trzpiot.users;

  user = {
    options = {
      username = mkStrOption null "The name of the user account.";
      name = mkStrOption null "The full name of the user.";
      email = mkStrOption null "The e-mail address of the user.";
      uid = mkIntOption null "The UID of the user.";
      shell = mkEnumOption [ "zsh" "fish" ] "zsh" "The shell for the user.";
    };
  };
in
{
  options.trzpiot.users = {
    enable = mkEnableOption "Users";

    users = mkOption {
      type = listOf (submodule user);
      default = [ ];
    };
  };

  config = mkIf cfg.enable {
    programs.fish.enable = mkIf (any (user: user.shell == "fish") cfg.users) true;

    users.users = listToAttrs (map
      (user:
        {
          name = user.username;
          value = {
            uid = user.uid;
            description = user.name;
            shell = pkgs.${user.shell};
            home = "/Users/${user.username}";
          };
        }
      )
      cfg.users
    );
  };
}
