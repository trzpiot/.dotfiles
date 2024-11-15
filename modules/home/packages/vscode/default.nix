{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) importJSON mkEnableOption mkIf;
  inherit (pkgs.vscode-utils) extensionFromVscodeMarketplace;

  settingsJson = importJSON ./settings.json;

  # TODO: Write script for updating custom extensions
  customExtensions = {
    syler = {
      sass-indented = extensionFromVscodeMarketplace {
        name = "sass-indented";
        publisher = "syler";
        version = "1.8.31";
        sha256 = "sha256-TmRPpDJsuJETOKIjTsHzy4LOPTOAg4q0DunLyv6FxhQ";
      };
    };
  };

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
      extensions =
        with pkgs.vscode-extensions;
        with customExtensions;
        [
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
          syler.sass-indented
        ];
    };
  };
}
