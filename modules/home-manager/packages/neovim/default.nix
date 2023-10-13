{ pkgs, ... }:

{
  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      {
        plugin = dracula-nvim;
        config = ''
          colorscheme dracula
          set termguicolors
        '';
      }
    ];
    extraLuaConfig = ''
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'dracula',
        }
      }
    '';
  };
}
