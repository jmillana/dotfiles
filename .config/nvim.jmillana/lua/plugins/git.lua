return {
	"lewis6991/gitsigns.nvim",
	enabled = vim.fn.executable "git" == 1,
	opts = function()
		local signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		}
	    local function map(mode, l, r, desc)
	        vim.keymap.set(mode, l, r, { desc = desc })
	    end

	    local gs = require("gitsigns")
		map({ "n", "v" }, "<leader>Gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
		map({ "n", "v" }, "<leader>Gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
		map("n", "<leader>GS", gs.stage_buffer, "Stage Buffer")
		map("n", "<leader>Gu", gs.undo_stage_hunk, "Undo Stage Hunk")
		map("n", "<leader>GR", gs.reset_buffer, "Reset Buffer")
		map("n", "<leader>Gp", gs.preview_hunk_inline, "Preview Hunk Inline")
		map("n", "<leader>Gb", function()
			gs.blame_line({ full = true })
		end, "Blame Line")
		map("n", "<leader>Gd", gs.diffthis, "Diff This")
		map("n", "<leader>GD", function()
			gs.diffthis("~")
		end, "Diff This ~")
	end,
}
