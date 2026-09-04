return {
	'nvim-telescope/telescope.nvim',
	enabled = require('config.util').not_vscode,
	event = 'VeryLazy',
	branch = 'master',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
	init = function()
		require('config.keymaps').telescope()
	end,
	config = function()
		require('telescope').setup({})
	end,
}
