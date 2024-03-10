vim.g.mapleader = " "

-- diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Normal --
-- Utilities
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "[W]rite changes" })

-- Plugin Manager
vim.keymap.set("n", "<leader>Pi", function()
	require("lazy").install()
end, { desc = "Plugins Install" })

vim.keymap.set("n", "<leader>Ps", function()
	require("lazy").home()
end, { desc = "Plugins Status" })

vim.keymap.set("n", "<leader>PS", function()
	require("lazy").sync()
end, { desc = "Plugins Sync" })

vim.keymap.set("n", "<leader>Pu", function()
	require("lazy").check()
end, { desc = "Plugins Check Updates" })

vim.keymap.set("n", "<leader>PU", function()
	require("lazy").update()
end, { desc = "Plugins Update" })

-- Clipboard settings
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to system clip" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "[P]aste from system clip" })
vim.keymap.set({ "n", "v" }, "<leader>x", [["+x]], { desc = "Cut[X] to system clip" })
vim.keymap.set({ "n", "v" }, "Y", [["+y]], { desc = "[Y]ank to system clip" })
vim.keymap.set({ "n", "v" }, "P", [["+p]], { desc = "[P]aste from system clip" })
vim.keymap.set({ "n", "v" }, "X", [["+x]], { desc = "Cut[X] to system clip" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "[D]elete to void" })

-- Tabs
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent line" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Unindent line" })

-- Dumb ass me
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Set executable
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file e[X]ecutable" })

-- Source file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end, { desc = "source file [ ]" })

-- Navigation
-- Arrow keys keep in the middle of the page
-- vim.keymap.set("n", "<Up>", "kzz", { desc = "Move up" })
-- vim.keymap.set("n", "<Down>", "jzz", { desc = "Move down" })

vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line below" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to previous match" })

vim.keymap.set(
	"n",
	"<C-f>",
	"<cmd>silent !kitty @ launch --type overlay kitty-sessionizer<CR>",
	{ desc = "Open kitty sessionizer" }
)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location" })
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location" })

vim.keymap.set(
	"n",
	"<leader>f",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "[F]ind and replace" }
)
