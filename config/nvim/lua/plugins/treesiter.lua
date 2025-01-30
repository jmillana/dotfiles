return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "python", "rust", "javascript", "html" },
			auto_intall = true,
			sync_install = false,
			highlight = { enable = true, disable = { "html" } },
			indent = { enable = true },
		})
	end,
}
