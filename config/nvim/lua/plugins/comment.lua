return {
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		config = function()
			require("todo-comments").setup({})
			vim.keymap.set("n", "<leader>sT", function()
				vim.cmd("TodoTelescope")
			end, { desc = "[S]earch [T]odo" })
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			opleader = {
				line = "<leader>/",
				block = "<leader>[",
			},
		},
		lazy = false,
	},
}
