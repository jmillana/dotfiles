return {
	-- Highlight todo, notes, etc in comments
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
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
