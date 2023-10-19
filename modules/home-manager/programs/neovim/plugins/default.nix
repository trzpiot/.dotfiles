{ pkgs, ... }:

let
  inherit (pkgs) vimPlugins;

  pluginsWithConfiguration = {
    dracula-nvim = {
      plugin = vimPlugins.dracula-nvim;
      config = ''
        colorscheme dracula
        set termguicolors
      '';
    };
  };
in
{
  programs.neovim.plugins = builtins.attrValues {
    inherit (vimPlugins)
      lualine-nvim;
    inherit (pluginsWithConfiguration)
      dracula-nvim;
  };
}
