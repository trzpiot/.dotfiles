{
  imports = [ ./plugins ];

  home.sessionVariables.MANPAGER = "nvim +Man!";

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    extraLuaConfig = builtins.readFile ./config.lua;
  };
}
