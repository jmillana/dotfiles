return {
	{
		"zbirenbaum/copilot.lua",
		requires = { "nvim-lua/plenary.nvim" },
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_prev = "<M-p>",
						jump_next = "<M-n>",
						accept = "<M-y>",
						refresh = "gr",
						open = "<M-CR>",
						close = "<Esc>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<M-y>",
						accept_word = false,
						accept_line = false,
						next = "<M-n>",
						prev = "<M-p>",
						dismiss = "<M-d>",
					},
				},
				filetypes = {
					markdown = true,
					yaml = true,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			-- { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		event = "VeryLazy",
		keys = {
			{ "<leader>cc", ":CopilotChat ", desc = "[C]opilot[C]hat" },
			{ "<leader>ce", ":CopilotChatExplain ", desc = "[C]opilotChat - [E]xplain" },
			{ "<leader>cT", "<cmd>CopilotChatTests<cr>", desc = "[C]opilotChat - Generate [T]ests" },
			{ "<leader>cd", "<cmd>CopilotChatDocs<cr>", desc = "[C]opilotChat - Generate [D]ocs" },
			{ "<leader>cR", "<cmd>CopilotChatReview<cr>", desc = "[C]opilotChat - [r]eview" },
			{ "<leader>cR", "<cmd>CopilotChatRefactor<cr>", desc = "[C]opilotChat - [R]efactor" },
			{
				"<leader>ct",
				":CopilotChatToggle<cr>",
				desc = "[C]opilotChat - [T]oggle Vsplit", -- Toggle vertical split
			},
			{
				"<leader>cv",
				":CopilotChatVisual<cr>",
				mode = "x",
				desc = "[C]opilotChat - Open in [V]ertical split",
			},
			{
				"<leader>cx",
				":CopilotChatInPlace<cr>",
				mode = "x",
				desc = "CopilotChat - E[X]ecute in-place code",
			},
			{
				"<leader>cf",
				"<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
				desc = "[C]opilotChat - [F]ix diagnostic",
			},
			{
				"<leader>cb",
				"<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
				desc = "[C]opilotChat - reset chat history and clear [b]uffer",
			},
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
