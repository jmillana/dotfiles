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
			{ "<leader>g", group = "[R]efactor" },
            { "<leader>c", group = "[C]ode" },
            { "<leader>d", group = "[D]ocument" },
            { "<leader>t", group = "[T]oggle" },
            { "<leader>g", group = " [g]o to"},
            { "<leader>w", group = "[W]orkspace"},
            { "<leader>P", group = " [P]lugins" },
            { "<leader>s", group = " [S]earch" },
            { "<leader>l", group = " [L]SP" },
            { "<leader>b", group = " [B]uffers" },
            { "<leader>G", group = " [G]IT" },
            { "<leader>r", group = "[R]e name" },
		})
	end,
}
