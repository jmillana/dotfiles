return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })
            vim.keymap.set("n", "<leader>fs", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end, { desc = "Grep find" })

            vim.keymap.set("n", "<leader>fh", function()
                require("telescope.builtin").help_tags()
            end, { desc = "Find help" })
            vim.keymap.set("n", "<leader>fk", function()
                require("telescope.builtin").keymaps()
            end, { desc = "Find keymaps" })
            vim.keymap.set("n", "<leader>fm", function()
                require("telescope.builtin").man_pages()
            end, { desc = "Find man" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {

                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
