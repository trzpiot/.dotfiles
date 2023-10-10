{ pkgs, ... }:

{
  home.file.vscodeSettings = {
    source = ./settings.json;
    target = ".config/Code/User/settings.json";
  };

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    extensions = with pkgs.vscode-extensions;
      [
        jnoortheen.nix-ide
        dracula-theme.theme-dracula
        rust-lang.rust-analyzer
        mkhl.direnv
        tamasfe.even-better-toml
        pkief.material-icon-theme
        yzhang.markdown-all-in-one
        foxundermoon.shell-format
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
        name = "volar";
        publisher = "Vue";
        version = "1.8.18";
        sha256 =
          "bc5e845139b5a6a608c1daaa681f9d6a1710ea26034dc750df860070b11ab9d4";
      }];
  };
}
