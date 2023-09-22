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
        version = "1.8.13";
        sha256 =
          "a83f81aa385ac980a3717da0184f322e3c6c02a729436df57b4080188f8a12c1";
      }];
  };
}
