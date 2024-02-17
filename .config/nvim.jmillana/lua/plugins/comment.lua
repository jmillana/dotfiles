return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
	},
	keys = {
		{ "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
		{ "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
		{ "<leader>/", mode = { "n", "v" }, desc = "Comment toggle linewise" },
	},
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>/", function()
			require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
		end, { desc = "Toggle comment line" })

		vim.keymap.set(
			"v",
			"<leader>/",
			"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			{ desc = "Toggle comment line" }
		)
	end,
}
