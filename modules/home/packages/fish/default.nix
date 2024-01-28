{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf optionalAttrs;
  inherit (pkgs.stdenv) isDarwin isLinux;
  inherit (lib.snowfall.fs) get-file;

  cfg = config.trzpiot.packages.fish;
  fastfetchCfg = config.trzpiot.packages.fastfetch;
  fastfetchCfgFile = get-file "modules/home/packages/fastfetch/config.jsonc";
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
        if fastfetchCfg.enable
        then "fastfetch - c ${fastfetchCfgFile}"
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
      } // optionalAttrs isLinux {
        nixos-custom = {
          body = builtins.readFile functions/nixos-custom.fish;
          description = "Custom commands for NixOS";
        };
      };
    };
  };
}

