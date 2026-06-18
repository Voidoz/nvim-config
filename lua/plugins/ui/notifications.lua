return {
	'rcarriga/nvim-notify',
	enabled = require('config.vscode.enabled').never,
	version = '^3',
	config = function()
		local palette = require("catppuccin.palettes").get_palette()
		require("notify").setup({
			background_colour = palette.base,
		})
	end,
}
