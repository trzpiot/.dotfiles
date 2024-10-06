{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) importJSON mkEnableOption mkIf;

  settingsJson = importJSON ./settings.json;

  cfg = config.trzpiot.packages.vscode;
in
{
  options.trzpiot.packages.vscode = {
    enable = mkEnableOption "Visual Studio Code";
  };

  config = mkIf cfg.enable {
    programs.vscode = {
      inherit (cfg) enable;

      mutableExtensionsDir = false;
      userSettings = settingsJson;

      # Normally I would work with `builtins.attrValues` here.
      # However, the *publisher.extension* structure makes it more bloated.
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        dracula-theme.theme-dracula
        rust-lang.rust-analyzer
        mkhl.direnv
        tamasfe.even-better-toml
        pkief.material-icon-theme
        yzhang.markdown-all-in-one
        foxundermoon.shell-format
        redhat.vscode-yaml
        ms-azuretools.vscode-docker
        gruntfuggly.todo-tree
        fill-labs.dependi
        sumneko.lua
        vue.volar
        svelte.svelte-vscode
      ];
    };
  };
}
