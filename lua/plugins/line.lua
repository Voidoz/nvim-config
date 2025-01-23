return {
	{
		'nvim-lualine/lualine.nvim',
		enabled = require('config.vscode.enabled').never,
		event = 'VeryLazy',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				theme = "tokyonight",
				disabled_filetypes = {
					'alpha',
					'oil',
				},
			},
		},
	},
	{
		"willothy/nvim-cokeline",
		event = 'BufEnter',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"stevearc/resession.nvim",
		},
		config = true,
	},
}
