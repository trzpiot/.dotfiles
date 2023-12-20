{ config, pkgs, lib, ... }:

let
  inherit (pkgs) vimPlugins;
  inherit (lib) mkEnableOption mkIf;

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
in
{
  options.trzpiot.packages.neovim = {
    enable = mkEnableOption "Neovim";
  };

  config = mkIf cfg.enable {
    home.sessionVariables.MANPAGER = "nvim +Man!";

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      extraLuaConfig = builtins.readFile ./config.lua;

      plugins = builtins.attrValues {
        inherit (vimPlugins)
          lualine-nvim;
        inherit (pluginsWithConfiguration)
          dracula-nvim;
      };
    };
  };
}
