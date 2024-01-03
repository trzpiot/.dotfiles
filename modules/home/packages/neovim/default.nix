{ config, pkgs, lib, ... }:

let
  inherit (pkgs) vimPlugins;
  inherit (lib) mkEnableOption mkIf;
  inherit (builtins) attrValues;

  cfg = config.trzpiot.packages.neovim;

  pluginsWithConfiguration = {
    dracula-nvim = {
      plugin = vimPlugins.dracula-nvim;
      config = ''
        colorscheme dracula
        set termguicolors
      '';
    };
  };

  extraLuaConfig = ''


    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'dracula',
        }
    }
  '';
in
{
  options.trzpiot.packages.neovim = {
    enable = mkEnableOption "Neovim";
  };

  config = mkIf cfg.enable {
    home.sessionVariables.MANPAGER = "nvim +Man!";

    programs.neovim = {
      inherit extraLuaConfig;

      enable = true;
      defaultEditor = true;
      viAlias = true;

      plugins = attrValues {
        inherit (vimPlugins)
          lualine-nvim
          neorg;
        inherit (vimPlugins.nvim-treesitter)
          withAllGrammars;
        inherit (pluginsWithConfiguration)
          dracula-nvim;
      };
    };
  };
}
