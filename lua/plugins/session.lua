return {
	'stevearc/resession.nvim',
	lazy = false,
	init = function()
		require('config.mappings').resession()
	end,
	opts = {},
}
