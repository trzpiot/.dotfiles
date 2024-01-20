{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf optionalAttrs;
  inherit (lib.trzpiot) isNixOS;
  inherit (pkgs.stdenv) isDarwin;

  cfg = config.trzpiot.packages.fish;
  fastfetchFg = config.trzpiot.packages.fastfetch;
  neofetchCfg = config.trzpiot.packages.neofetch;
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
      interactiveShellInit =
        if fastfetchFg.enable
        then "fastfetch"
        else if neofetchCfg.enable
        then "neofetch"
        else null;

      shellAliases = {
        cat = "bat";
        find = "fd";
        lg = "lazygit";
      } // optionalAttrs isDarwin {
        vi = "nvim";
        vim = "nvim";
      };

      functions = {
        gitignore = "curl -sL https://www.gitignore.io/api/$argv";
      } // optionalAttrs isNixOS {
        nixos-custom = {
          body = builtins.readFile functions/nixos-custom.fish;
          description = "Custom commands for NixOS";
        };
      };
    };
  };
}
