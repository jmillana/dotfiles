return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		local get_icon = require("jmillana.utils").get_icon
		wk.register({
			P = {
				name = get_icon("Plugins") .. "Plugins",
			},
			f = {
				name = get_icon("Search") .. "Find",
			},
			l = {
				name = get_icon("ActiveLSP") .. "LSP",
			},
			b = {
				name = get_icon("") .. "Buffers",
			},
			g = {
				name = "Go To",
			},
		}, { prefix = "<leader>" })
	end,
	opts = {
		icons = {
			group = "",
		},
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
