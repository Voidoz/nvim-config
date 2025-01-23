return {
	'akinsho/toggleterm.nvim',
	-- enabled = require('config.vscode.enabled').never,
	enabled = false,
	event = 'VeryLazy',
	version = "*",
	init = function()
		require('config.mappings').toggleterm()
	end,
	config = function()
		require('toggleterm').setup {}
	end,
}
