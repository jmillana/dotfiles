return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
		local maps = vim.api.nvim_set_keymap
		-- Move to previous/next
		maps("n", "<A-,>", "<Cmd>BufferPrevious<CR>", {desc = "Move to previous buffer"})
		maps("n", "<A-.>", "<Cmd>BufferNext<CR>", {desc = "Move to next buffer"})
		-- Re-order to previous/next
		maps("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", {desc = "Move buffer to previous"})
		maps("n", "<A->>", "<Cmd>BufferMoveNext<CR>", {desc = "Move buffer to next"})
		-- Goto buffer in position...
		maps("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", {desc= "Jump to buffer 1"})
		maps("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", {desc= "Jump to buffer 2"})
		maps("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", {desc= "Jump to buffer 3"})
		maps("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", {desc= "Jump to buffer 4"})
		maps("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", {desc= "Jump to buffer 5"})
		maps("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", {desc= "Jump to buffer 6"})
		maps("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", {desc= "Jump to buffer 7"})
		maps("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", {desc= "Jump to buffer 8"})
		maps("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", {desc= "Jump to buffer 9"})
		maps("n", "<A-0>", "<Cmd>BufferLast<CR>", {desc= "Jump to last"})
		-- Pin/unpin buffer
		--" 
		maps("n", "<A-p>", "<Cmd>BufferPin<CR>", {desc= "Pin Buffer"} )
		-- Close buffer
		maps("n", "<A-c>", "<Cmd>BufferClose<CR>", {desc= "Close buffer"})
		-- Magic buffer-picking mode
		maps("n", "<C-p>", "<Cmd>BufferPick<CR>", {desc= "Jump to buffer 1"})
		-- Sort automatically by...
		maps("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", {desc= "Sort by buff number"})
		maps("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", {desc= "Sort by directory"})
		maps("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", {desc= "Sort by language"})
		maps("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", {desc= "Sort by window number"})

		-- Duplicate with <leader>b prefix
		maps("n", "<leader>b,", "<Cmd>BufferPrevious<CR>", {desc = "Move to previous buffer"})
		maps("n", "<leader>b.", "<Cmd>BufferNext<CR>", {desc = "Move to next buffer"})
		maps("n", "<leader>b<", "<Cmd>BufferMovePrevious<CR>", {desc = "Move buffer to previous"})
		maps("n", "<leader>b>", "<Cmd>BufferMoveNext<CR>", {desc = "Move buffer to next"})
		maps("n", "<leader>b1", "<Cmd>BufferGoto 1<CR>", {desc= "Jump to buffer 1"})
		maps("n", "<leader>b2", "<Cmd>BufferGoto 2<CR>", {desc= "Jump to buffer 2"})
		maps("n", "<leader>b3", "<Cmd>BufferGoto 3<CR>", {desc= "Jump to buffer 3"})
		maps("n", "<leader>b4", "<Cmd>BufferGoto 4<CR>", {desc= "Jump to buffer 4"})
		maps("n", "<leader>b5", "<Cmd>BufferGoto 5<CR>", {desc= "Jump to buffer 5"})
		maps("n", "<leader>b6", "<Cmd>BufferGoto 6<CR>", {desc= "Jump to buffer 6"})
		maps("n", "<leader>b7", "<Cmd>BufferGoto 7<CR>", {desc= "Jump to buffer 7"})
		maps("n", "<leader>b8", "<Cmd>BufferGoto 8<CR>", {desc= "Jump to buffer 8"})
		maps("n", "<leader>b9", "<Cmd>BufferGoto 9<CR>", {desc= "Jump to buffer 9"})
		maps("n", "<leader>b0", "<Cmd>BufferLast<CR>", {desc= "Jump to last"})
		maps("n", "<leader>bp", "<Cmd>BufferPin<CR>", {desc= "Pin Buffer"} )
		maps("n", "<leader>bc", "<Cmd>BufferClose<CR>", {desc= "Close buffer"})
		maps("n", "<leader>bP", "<Cmd>BufferPick<CR>", {desc= "Jump to buffer 1"})
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
