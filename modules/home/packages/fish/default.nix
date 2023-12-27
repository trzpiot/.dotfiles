{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.fish;
in
{
  options.trzpiot.packages.fish = {
    enable = mkEnableOption "fish";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      shellInit = ''
        complete -f -c nixos-custom -n '__fish_use_subcommand' -a 'check' -d 'Check NixOS configuration'
        complete -f -c nixos-custom -n '__fish_use_subcommand' -a 'clean' -d 'Clean up NixOS'
        complete -f -c nixos-custom -n '__fish_use_subcommand' -a 'config' -d 'Edit NixOS configuration'
        complete -f -c nixos-custom -n '__fish_use_subcommand' -a 'switch' -d 'Switch to a new NixOS configuration'
        complete -f -c nixos-custom -n '__fish_use_subcommand' -a 'update' -d 'Update NixOS and switch to a new configuration'
      '';
      interactiveShellInit = "neofetch";

      shellAliases = {
        cat = "bat";
        find = "fd";
        lg = "lazygit";
      };

      functions = {
        nixos-custom = {
          body = builtins.readFile functions/nixos-custom.fish;
          description = "Custom commands for NixOS";
        };

        gitignore = "curl -sL https://www.gitignore.io/api/$argv";

        devenv = {
          body = builtins.readFile functions/devenv-init.fish;
          description = "Initialize a develop environment (with devenv)";
        };
      };
    };
  };
}
