-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end

return {
	'stevearc/oil.nvim',
	cmd = 'Oil',
	lazy = false,
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	init = function()
		require('config.mappings').oil()
	end,
	config = function()
		require('oil').setup({
			default_file_explorer = true,
			win_options = {
				winbar = "%!v:lua.get_oil_winbar()",
			},
			view_options = {
				show_hidden = true,
			},
		})

		-- Disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- Auto-open oil when opening a directory instead of netrw
		vim.api.nvim_create_autocmd('BufEnter', {
			desc = 'Open oil on directory',
			group = vim.api.nvim_create_augroup("OilAutocmds", { clear = true }),
			callback = function()
				local bufname = vim.api.nvim_buf_get_name(0)
				if vim.fn.isdirectory(bufname) == 1 then
					vim.defer_fn(function() require('oil').open(bufname) end, 0)
				end
			end,
		})
	end,
}
