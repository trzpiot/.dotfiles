{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.trzpiot) mkEnumOption;
  cfg = config.trzpiot.users;
in
{
  options.trzpiot.users = {
    enable = mkEnableOption "Users";
    default-shell = mkEnumOption [ "bash" "fish" ] "bash" "The default shell.";
  };

  config = mkIf cfg.enable {
    programs.fish.enable = mkIf (cfg.default-shell == "fish") true;

    users.users.sebastian = {
      isNormalUser = true;
      description = "Sebastian Gabriel Trzpiot";
      extraGroups = [ "networkmanager" "wheel" ];
      shell =
        if cfg.default-shell == "fish" then
          pkgs.fish
        else
          pkgs.bash;
    };
  };
}
