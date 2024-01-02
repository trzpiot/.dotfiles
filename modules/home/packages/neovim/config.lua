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
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                },
            },
        },
    },
}
