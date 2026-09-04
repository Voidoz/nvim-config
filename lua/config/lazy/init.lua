-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
-- lazy.nvim only imports the top-level *.lua files of a given module path
-- (plus any subdirectory that has its own init.lua), so each plugin
-- category directory under lua/plugins/ needs to be imported explicitly.
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.editor" },
		{ import = "plugins.completion" },
		{ import = "plugins.lsp" },
		{ import = "plugins.git" },
		{ import = "plugins.debugging" },
		{ import = "plugins.ui" },
		{ import = "plugins.ui.colorscheme" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "habamax" } },

	-- automatically check for plugin updates
	-- checker = { enabled = true },
})

if not vim.g.vscode then
	vim.notify = require('notify')
	vim.cmd [[colorscheme catppuccin-nvim]]
end
