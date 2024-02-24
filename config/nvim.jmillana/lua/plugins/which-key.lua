return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		local get_icon = require("jmillana.utils").get_icon
		wk.register({
		    r = {
		        name = "[R]eplace",
		    },
		    c = {
		        name = "[C]ode",
		    },
		    d = {
		        name = "[D]ocument",
		    },
		    t = {
		        name = "[T]oggle",
		    },
		    w = {
                name = "[W]orkspace"
		    },
			P = {
				name = get_icon("Plugins") .. "[P]lugins",
			},
			s = {
				name = get_icon("Search") .. "[S]earch",
			},
			l = {
				name = get_icon("ActiveLSP") .. "[L]SP",
			},
			b = {
				name = get_icon("Buffers") .. "[B]uffers",
			},
			g = {
				name = get_icon("GoTo"), "[G]o To",
			},
			G = {
				name = get_icon("GitHub") .. "[G]IT",
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
