{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (builtins) attrValues;
  inherit (lib) mkEnableOption mkIf;
  inherit (pkgs) vimPlugins;

  cfg = config.trzpiot.packages.neovim;

  pluginsWithConfiguration = {
    dracula-vim = {
      plugin = vimPlugins.dracula-vim;
      config = ''
        colorscheme dracula
        set termguicolors
      '';
    };
  };

  extraLuaConfig = builtins.readFile ./config.lua;
in
{
  options.trzpiot.packages.neovim = {
    enable = mkEnableOption "Neovim";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      inherit (cfg) enable;
      inherit extraLuaConfig;

      extraConfig = ''
        set number
      '';

      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      plugins = attrValues {
        inherit (vimPlugins) lualine-nvim neorg;
        inherit (vimPlugins.nvim-treesitter) withAllGrammars;
        inherit (pluginsWithConfiguration) dracula-vim;
      };
    };
  };
}
