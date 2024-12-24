{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf optionalAttrs;
  inherit (lib.snowfall.fs) get-file;
  inherit (pkgs.stdenv) isDarwin;

  tmuxCfg = config.trzpiot.packages.tmux;
  fastfetchCfg = config.trzpiot.packages.fastfetch;
  fastfetchCfgFile = get-file "modules/home/packages/fastfetch/config.jsonc";
  neofetchCfg = config.trzpiot.packages.neofetch;
  anyNixShellCfg = config.trzpiot.packages.any-nix-shell;

  cfg = config.trzpiot.packages.fish;
in
{
  options.trzpiot.packages.fish = {
    enable = mkEnableOption "fish";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      inherit (cfg) enable;

      shellInit = ''
        complete -f -c nix-custom -n '__fish_use_subcommand' -a 'check' -d 'Check configuration'
        complete -f -c nix-custom -n '__fish_use_subcommand' -a 'clean' -d 'Clean up'
        complete -f -c nix-custom -n '__fish_use_subcommand' -a 'config' -d 'Edit configuration'
        complete -f -c nix-custom -n '__fish_use_subcommand' -a 'help' -d 'Shows information about nix-custom'
        complete -f -c nix-custom -n '__fish_use_subcommand' -a 'switch' -d 'Switch to a new configuration'
        complete -f -c nix-custom -n '__fish_use_subcommand' -a 'update' -d 'Update and switch to a new configuration'
      '';
      interactiveShellInit =
        (
          if fastfetchCfg.enable then
            "fastfetch -c ${fastfetchCfgFile}"
          else if neofetchCfg.enable then
            "neofetch"
          else
            ""
        )
        + (
          if tmuxCfg.enable then
            ''

              if not set -q TMUX
                tmux new-session -As session_name
              end
            ''
          else
            ""
        )
        + (
          if anyNixShellCfg.enable then
            ''

              any-nix-shell fish --info-right | source
            ''
          else
            ""
        );

      shellAliases =
        {
          cat = "bat";
          devenv = "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/trzpiot/dev-env-template/main/dev-env-template.sh)\"";
          find = "fd";
          lg = "lazygit";
        }
        // optionalAttrs isDarwin {
          docker = "podman";
          vi = "nvim";
          vim = "nvim";
        };

      functions = {
        nix-custom = {
          body = builtins.readFile (
            pkgs.replaceVars ./functions/nix-custom.fish {
              inherit isDarwin;
            }
          );
          description = if isDarwin then "Custom commands for nix-darwin" else "Custom commands for NixOS";
        };
      };
    };
  };
}
