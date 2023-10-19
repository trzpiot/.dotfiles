{ pkgs, ... }:

let
  inherit (pkgs) vscode-extensions;
  inherit (pkgs.vscode-utils) extensionFromVscodeMarketplace;

  # TODO: Write script for updating custom extensions
  customExtensions = {
    volar = {
      vue = extensionFromVscodeMarketplace {
        name = "volar";
        publisher = "Vue";
        version = "1.8.18";
        sha256 = "bc5e845139b5a6a608c1daaa681f9d6a1710ea26034dc750df860070b11ab9d4";
      };
    };
  };
in
{
  programs.vscode.extensions = builtins.attrValues
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
      inherit (customExtensions.volar)
        vue;
    };
}
