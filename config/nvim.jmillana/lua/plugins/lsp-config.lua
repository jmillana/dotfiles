return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Additional lua configuration, makes nvim stuff amazing!
		"folke/neodev.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		{
			"stevearc/conform.nvim",
			opts = {
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = false,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
				},
			},
		},
	},
	config = function()
		require("neodev").setup()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach-group", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Jump to the definition of the word under your cursor.
				--  To jump back, press <C-T>.
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				-- Rename the variable under your cursor
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", function()
					vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
				end, "[C]ode [A]ction")
				-- See `:help K` for why this keymap
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				-- Show the signature of the function you're currently completing.
				map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

				-- local client = vim.lsp.get_client_by_id(event.data.client_id)
				-- if client and client.server_capabilities.
				-- Highligh references of the word under the cursor
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					callback = vim.lsp.buf.document_highlight,
				})
				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					callback = vim.lsp.buf.clear_references,
				})
			end,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		-- local lspconfig = require("lspconfig")
		local servers = {
			-- pyright = {
			--     settings = {
			--         autoImportCompletion = true,
			--         python = {
			--             analysis = {
			--                 autoSearchPaths = true,
			--                 diagnosticMode = "openFilesOnly",
			--                 useLibraryCodeForTypes = true,
			--             },
			--         },
			--     },
			-- },
		}
		-- Ensure servers are installed
		require("mason").setup()
		local installed = { "lua_ls", "biome", "ruff-lsp", "rust_analyzer", "terraformls" }
		vim.list_extend(installed, vim.tbl_keys(servers))
		require("mason-tool-installer").setup({
			ensure_installed = installed,
			automatic_installation = true,
		})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					require("lspconfig")[server_name].setup({
						cmd = server.cmd,
						settings = server.settings,
						filetypes = server.filetypes,
						on_attach = on_attach,
						-- TODO: Think about what we wanna do here.
						-- capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities),
						capabilities = server.capabilities or capabilities,
					})
				end,
			},
		})

		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		-- 	callback = function(ev)
		-- 		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
		-- 		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		-- 		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
		-- 		vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Search references forwards" })
		-- 		vim.keymap.set("n", "lk", vim.lsp.buf.hover, { desc = "Hover Documentation" })
		-- 		vim.keymap.set("n", "k", vim.lsp.buf.hover, { desc = "Hover Documentation" })
		--
		-- 		-- Hover diagnostics in the current currsor location
		-- 		vim.keymap.set("n", "<leader>ld", function()
		-- 			vim.diagnostic.open_float()
		-- 		end, { desc = "Hover diagnostics over current location" })
		--
		-- 		-- Hover all the diagnostics
		-- 		vim.keymap.set("n", "<leader>lD", function()
		-- 			require("telescope.builtin").diagnostics()
		-- 		end, { desc = "Search all diagnostics" })
		-- 		vim.keymap.set("n", "ls", vim.lsp.buf.signature_help, { desc = "Hover Signature" })
		-- 		vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code Actions" })
		-- 		vim.keymap.set("n", "<leader>F", function()
		-- 			vim.lsp.buf.format({ async = true })
		-- 		end, { desc = "Format buffer" })
		-- 		vim.keymap.set("n", "<leader>lf", function()
		-- 			vim.lsp.buf.format({ async = true })
		-- 		end, { desc = "Format buffer" })
		-- 	end,
		-- })
		-- -- Mason info
		-- vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP information" })
		--
		-- -- NONE LS Info
		-- vim.keymap.set("n", "<leader>lI", "<cmd>NullLsInfo<cr>", { desc = "Null-ls information" })
		local sign = function(opts)
			vim.fn.sign_define(opts.name, {
				texthl = opts.name,
				text = opts.text,
				numhl = "",
			})
		end
		local get_icon = require("jmillana.utils").get_icon
		sign({ name = "DiagnosticSignError", text = get_icon("DiagnosticError") })
		sign({ name = "DiagnosticSignWarn", text = get_icon("DiagnosticWarn") })
		sign({ name = "DiagnosticSignHint", text = get_icon("DiagnosticHint") })
		sign({ name = "DiagnosticSignInfo", text = get_icon("DiagnosticInfo") })
	end,
}
