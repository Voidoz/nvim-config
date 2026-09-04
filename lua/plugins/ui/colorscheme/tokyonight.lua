return {
	"folke/tokyonight.nvim",
	enabled = require('config.util').not_vscode,
	lazy = false,
	priority = 1000,
	config = function()
		require('tokyonight').setup({ style = "night" })
	end,
}
