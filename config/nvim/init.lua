vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.g.python3_host_prog = "~/.pyenv/versions/nvim/bin/python3"
-- vim.g.python3_host_prog = "~/.pyenv/versions/3.8.10/bin/python3"
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
