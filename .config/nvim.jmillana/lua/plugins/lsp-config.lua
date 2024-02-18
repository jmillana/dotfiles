return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "biome", "pyright", "rust_analyzer", "terraformls" },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.biome.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Search references forwards" })
                    vim.keymap.set("n", "lk", vim.lsp.buf.hover, { desc = "Hover Documentation" })
                    vim.keymap.set("n", "k", vim.lsp.buf.hover, { desc = "Hover Documentation" })

                    -- Hover diagnostics in the current currsor location
                    vim.keymap.set("n", "<leader>ld", function()
                        vim.diagnostic.open_float()
                    end, { desc = "Hover diagnostics over current location" })

                    -- Hover all the diagnostics
                    vim.keymap.set("n", "<leader>lD", function()
                        require("telescope.builtin").diagnostics()
                    end, { desc = "Search all diagnostics" })
                    vim.keymap.set("n", "ls", vim.lsp.buf.signature_help, { desc = "Hover Signature" })
                    vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code Actions" })
                    vim.keymap.set("n", "<leader>F", function()
                        vim.lsp.buf.format({ async = true })
                    end, { desc = "Format buffer" })
                    vim.keymap.set("n", "<leader>lf", function()
                        vim.lsp.buf.format({ async = true })
                    end, { desc = "Format buffer" })
                end
            })
            -- Mason info
            vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP information" })

            -- NONE LS Info
            vim.keymap.set("n", "<leader>lI", "<cmd>NullLsInfo<cr>", { desc = "Null-ls information" })
            local sign = function(opts)
                vim.fn.sign_define(opts.name, {
                    texthl = opts.name,
                    text = opts.text,
                    numhl = ''
                })
            end
            local get_icon = require("jmillana.utils").get_icon
            sign({ name = 'DiagnosticSignError', text = get_icon("DiagnosticError") })
            sign({ name = 'DiagnosticSignWarn', text =  get_icon("DiagnosticWarn") })
            sign({ name = 'DiagnosticSignHint', text = get_icon("DiagnosticHint") })
            sign({ name = 'DiagnosticSignInfo', text = get_icon("DiagnosticInfo") })
        end,
    },
}
