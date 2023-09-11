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
        bbenoist.nix
        brettm12345.nixfmt-vscode
        dracula-theme.theme-dracula
        rust-lang.rust-analyzer
        mkhl.direnv
        tamasfe.even-better-toml
        pkief.material-icon-theme
        yzhang.markdown-all-in-one
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
        name = "volar";
        publisher = "Vue";
        version = "1.8.10";
        sha256 =
          "35efd0a6a116b5bb97df7eba16294b0848241dc996ca428ba291158c325e03a4";
      }];
  };
}
