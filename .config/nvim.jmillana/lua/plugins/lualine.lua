return {

    "nvim-lualine/lualine.nvim",
    dependencies = {
        "arkav/lualine-lsp-progress",
        "dokwork/lualine-ex",
    },
    config = function()
        local utils = require("jmillana.utils")
        require("lualine").setup({
            options = {
                theme = "catppuccin-mocha",
            },
            sections = {
                lualine_y = {
                    {
                        "ex.lsp.null_ls",
                        sources_name_separator = ",",
                    }
                },

                lualine_c = {
                    "lsp_progress",
                },
            },
        })
    end,
}
