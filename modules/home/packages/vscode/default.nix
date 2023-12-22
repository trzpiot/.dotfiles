{ config, pkgs, lib, ... }:

let
  inherit (pkgs) vscode-extensions;
  inherit (pkgs.vscode-utils) extensionFromVscodeMarketplace;
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.vscode;

  # TODO: Write script for updating custom extensions
  customExtensions = {
    volar = {
      vue = extensionFromVscodeMarketplace {
        name = "volar";
        publisher = "Vue";
        version = "1.8.25";
        sha256 = "sha256-3RQ8dBy83QblARNMjy5RliVYSxEUdJA/3yyWcLK0wVQ=";
      };
    };
  };
in
{
  options.trzpiot.packages.vscode = {
    enable = mkEnableOption "Visual Studio Code";
  };

  config = mkIf cfg.enable {
    home.file.vscodeSettings = {
      source = ./settings.json;
      target = ".config/Code/User/settings.json";
    };

    programs.vscode = {
      enable = true;
      mutableExtensionsDir = false;

      extensions = builtins.attrValues
        {
          inherit (vscode-extensions.jnoortheen)
            nix-ide;
          inherit (vscode-extensions.dracula-theme)
            theme-dracula;
          inherit (vscode-extensions.rust-lang)
            rust-analyzer;
          inherit (vscode-extensions.mkhl)
            direnv;
          inherit (vscode-extensions.tamasfe)
            even-better-toml;
          inherit (vscode-extensions.pkief)
            material-icon-theme;
          inherit (vscode-extensions.yzhang)
            markdown-all-in-one;
          inherit (vscode-extensions.foxundermoon)
            shell-format;
          inherit (vscode-extensions.redhat)
            vscode-yaml;
          inherit (vscode-extensions.ms-azuretools)
            vscode-docker;
          inherit (customExtensions.volar)
            vue;
        };
    };
  };
}
