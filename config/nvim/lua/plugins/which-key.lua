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
		wk.add({
		    { "<leader>r", name = "[R]efactor",},
		    { "<leader>c", name = "[C]ode",},
		    { "<leader>d", name = "[D]ebug",},
		    { "<leader>t", name = "[T]oggle"},
		    { "<leader>w", name = "[W]orkspace"},
	        { "<leader>P", name = get_icon("Plugins") .. "[P]lugins",},
		    { "<leader>s", name = get_icon("Search") .. "[S]earch",},
            { "<leader>l", name = get_icon("ActiveLSP") .. "[L]SP",},
            { "<leader>b", name = get_icon("Buffers") .. "[B]uffers",},
            { "<leader>g", name = get_icon("GoTo") .. "[G]o To",},
            { "<leader>G", name = get_icon("GitHub") .. "[G]IT",},
		})
	end,
}
