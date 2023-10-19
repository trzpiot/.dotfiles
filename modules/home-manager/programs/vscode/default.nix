{
  imports = [ ./extensions ];

  home.file.vscodeSettings = {
    source = ./settings.json;
    target = ".config/Code/User/settings.json";
  };

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
  };
}
