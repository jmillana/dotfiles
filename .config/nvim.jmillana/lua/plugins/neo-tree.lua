return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		enable_git_status = true,
		follow_current_file = { enabled = true, leave_dirs_open = false },
	},
	config = function()
		require("neo-tree").setup({})
		vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { desc = "Toggele Explorer" })
		vim.keymap.set("n", "<C-o>", function()
			if vim.bo.filetype == "neo-tree" then
				vim.cmd.wincmd("p")
			else
				vim.cmd.Neotree("focus")
			end
		end, { desc = "Toggle Explorer Focus" })
	end,
}
