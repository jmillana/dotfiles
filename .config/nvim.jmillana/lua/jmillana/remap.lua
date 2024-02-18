vim.g.mapleader = " "

vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Normal --
local maps = vim.api.nvim_set_keymap

-- Utilities
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })

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
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clip" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Past from system clip" })
vim.keymap.set({ "n", "v" }, "<leader>x", [["+x]], { desc = "Cut to system clip" })
vim.keymap.set({ "n", "v" }, "Y", [["+y]], { desc = "Yank to system clip" })
vim.keymap.set({ "n", "v" }, "P", [["+p]], { desc = "Past from system clip" })
vim.keymap.set({ "n", "v" }, "X", [["+x]], { desc = "Cut to system clip" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void" })

-- Dumb ass me
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Set executable
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "source file" })

-- Navigation
-- Arrow keys keep in the middle of the page
vim.keymap.set("n", "<Up>", "kzz", { desc = "Move up" })
vim.keymap.set("n", "<Down>", "jzz", { desc = "Move down" })

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

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location" })

vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Search and replace" }
)
