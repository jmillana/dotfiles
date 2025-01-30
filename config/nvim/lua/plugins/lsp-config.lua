return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Additional lua configuration, makes nvim stuff amazing!
		"folke/neodev.nvim",
		-- Add spinners
		{ "j-hui/fidget.nvim", opts = {} },
		-- Format on save
		{
			"stevearc/conform.nvim",
			opts = {
				format_on_save = { timeout_ms = 500 },
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					javascript = { "prettier", "eslint" },
					javascriptreact = { "prettier", "eslint" },
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

				-- Highligh references of the word under the cursor
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		local servers = {
			pyright = {
				settings = {
					autoImportCompletion = true,
					python = {
						pythonPath = vim.fn.trim(vim.fn.system("poetry env info --path")) .. "/bin/python",
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			},
		}
		-- Ensure servers are installed
		require("mason").setup()
		local installed = { "lua_ls", "biome", "rust_analyzer", "terraformls", "pyright" }
		vim.list_extend(installed, vim.tbl_keys(servers))
		require("mason-tool-installer").setup({
			ensure_installed = installed,
			automatic_installation = true,
		})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilites = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

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
