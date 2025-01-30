if vim.fn.has("win32") == 1 then
	vim.opt.shell = "powershell.exe"
	vim.g.python3_host_prog = "C:\\Users\\Jordi\\.pyenv\\pyenv-win\\versions\\3.12.2\\python.exe"
	vim.g.python3_host_prog = "~\\.pyenv\\versions\\nvim\\bin\\python3"
else
	vim.g.python3_host_prog = "~/.pyenv/versions/nvim/bin/python3"
end
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.g.python3_host_prog = "/home/jordi/.pyenv/versions/nvim/bin/python3.12.7"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("jmillana")
require("lazy").setup("plugins")
