-- General editor options (kept separate from the lazy.nvim bootstrap so
-- that plain vim.opt settings are easy to find and edit on their own).

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.exrc = true

vim.opt.termguicolors = true
vim.opt.mousemoveevent = true

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 0

vim.filetype.add { extension = { gohtml = 'html', } }
