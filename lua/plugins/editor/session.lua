return {
	'stevearc/resession.nvim',
	enabled = false,
	lazy = false,
	init = function()
		require('config.keymaps').resession()
	end,
	opts = {},
}
