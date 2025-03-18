return {
	"glepnir/template.nvim",
	cmd = { "Template", "TemProject" },
	config = function()
		local template = require("template")
		template.setup({
			temp_dir = vim.fn.stdpath("config") .. "/templates",
			author = "Jmillana",
			-- config in there
		})
		template.register("{{__path__}}", function()
			vim.fn.expand("%")
		end)
		local telescope = require("telescope")
		telescope.load_extension("find_template")
		vim.keymap.set("n", "<Leader>t", function()
			vim.fn.feedkeys(":Template ")
		end, { remap = true })
	end,
}
