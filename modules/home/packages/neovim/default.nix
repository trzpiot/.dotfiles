{ config, pkgs, lib, ... }:

let
  inherit (pkgs) vimPlugins;
  inherit (lib) mkOption mkEnableOption mkIf;
  inherit (lib.options) literalExpression;
  inherit (lib.types) str attrsOf submodule;
  inherit (lib.strings) concatStringsSep;
  inherit (builtins) map getAttr attrNames attrValues;

  cfg = config.trzpiot.packages.neovim;

  join = set: sep: concatStringsSep sep (map (key: "${key} = \"${getAttr key set}\"") (attrNames set));

  pluginsWithConfiguration = {
    dracula-nvim = {
      plugin = vimPlugins.dracula-nvim;
      config = ''
        colorscheme dracula
        set termguicolors
      '';
    };
  };

  neorgModule = submodule {
    options = {
      workspaces = mkOption {
        type = attrsOf str;
        default = { };
        example = literalExpression ''
          {
            private = "~/notes/private";
            work = "~/notes/work";
          }
        '';
        description = "The workspaces of Neorg.";
      };
    };
  };

  extraLuaConfig = ''


    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'dracula',
        }
    }

    require 'nvim-treesitter.configs'.setup { 
        highlight = {
            enable = true
        }
    }

    require('neorg').setup {
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        ${join cfg.neorg.workspaces ",\n\t\t\t\t\t"}
                    },
                },
            },
        },
    }
  '';
in
{
  options.trzpiot.packages.neovim = {
    enable = mkEnableOption "Neovim";

    neorg = mkOption {
      type = neorgModule;
      default = { };
      description = "Neorg configuration.";
    };
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
