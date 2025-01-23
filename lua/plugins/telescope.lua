return {
	'nvim-telescope/telescope.nvim',
	enabled = require('config.vscode.enabled').never,
	event = 'VeryLazy',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
	init = function()
		require('config.mappings').telescope()
	end,
	config = function()
		require('telescope').setup({})
	end,
}
