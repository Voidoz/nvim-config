return {
	'nvim-treesitter/nvim-treesitter',
	enabled = require('config.vscode.enabled').never,
	event = 'BufEnter',
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = {
				"c",
				"c_sharp",
				"cmake",
				"cpp",
				"dart",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc"
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		}
	end
}
