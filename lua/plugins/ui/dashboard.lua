return {
	"goolord/alpha-nvim",
	enabled = require('config.util').not_vscode,
	event = "VimEnter",
	dependencies = { { 'nvim-tree/nvim-web-devicons' } },

	config = function()
		require('alpha').setup(require('config.dashboard.theme').config)

		-- require('config.keymaps').alpha()

		-- open dashboard after closing lazy
		if vim.o.filetype == "lazy" then
			vim.api.nvim_create_autocmd("WinClosed", {
				pattern = tostring(vim.api.nvim_get_current_win()),
				once = true,
				callback = function()
					vim.schedule(function()
						require('alpha').start()
					end)
				end,
			})
		end
	end,
}
