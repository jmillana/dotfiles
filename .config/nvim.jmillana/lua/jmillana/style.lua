vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
local home = os.getenv("HOME") 
if home == nil then
    -- Puaj windows
    home = os.getenv("HOMEPATH")
end
vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.breakindent = true
vim.opt.preserveindent = true
vim.opt.fileencoding = "utf-8"
vim.opt.infercase = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.relativenumber = true

vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
