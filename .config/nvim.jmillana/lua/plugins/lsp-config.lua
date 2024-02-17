return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "biome", "pyright", "rust_analyzer", "terraformls" },
				automatic_installation = true,
			})
			
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
			    capabilities = capabilities
			})
			lspconfig.biome.setup({
			    capabilities = capabilities
			})
			lspconfig.pyright.setup({
			    capabilities = capabilities
			})
			lspconfig.rust_analyzer.setup({
			    capabilities = capabilities
			})
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc = "Go to declaration"})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = "Go to definition"})
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {desc = "Go to implementation"})
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, {desc = "Search references forwards"})
			vim.keymap.set('n', 'lk', vim.lsp.buf.hover, {desc = "Hover Documentation"})


            vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, { desc = "Hover diagnostics" })

			vim.keymap.set('n', 'ls', vim.lsp.buf.signature_help, {desc = "Hover Signature"})
			vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, {desc = "Code Actions"})
			vim.keymap.set('n', '<leader>F', function()
				vim.lsp.buf.format { async = true }
			end, {desc = "Format buffer"})
			vim.keymap.set('n', '<leader>lf', function()
				vim.lsp.buf.format { async = true }
			end, {desc = "Format buffer"})
		end
	},
}
