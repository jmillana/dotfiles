return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		local opts = {
			icons = {
				group = "",
			},
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
		wk.setup(opts)
		local get_icon = require("jmillana.utils").get_icon
		wk.register({
			r = {
				name = "[R]efactor",
				_ = "which_key_ignore",
			},
			c = {
				name = "[C]ode",
				_ = "which_key_ignore",
			},
			d = {
				name = "[D]ebug",
				_ = "which_key_ignore",
			},
			t = {
				name = "[T]oggle",
				_ = "which_key_ignore",
			},
			w = {
				name = "[W]orkspace",
				_ = "which_key_ignore",
			},
			P = {
				name = get_icon("Plugins") .. "[P]lugins",
				_ = "which_key_ignore",
			},
			s = {
				name = get_icon("Search") .. "[S]earch",
				_ = "which_key_ignore",
			},
			l = {
				name = get_icon("ActiveLSP") .. "[L]SP",
				_ = "which_key_ignore",
			},
			b = {
				name = get_icon("Buffers") .. "[B]uffers",
				_ = "which_key_ignore",
			},
			g = {
				name = get_icon("GoTo") .. "[G]o To",
				_ = "which_key_ignore",
			},
			G = {
				name = get_icon("GitHub") .. "[G]IT",
				_ = "which_key_ignore",
			},
		}, { prefix = "<leader>" })
	end,
}
