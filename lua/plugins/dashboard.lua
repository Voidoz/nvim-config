return {
    "goolord/alpha-nvim",
    enabled = require('config.vscode.enabled').never,
    event = "VimEnter",
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    config = function()
        require('alpha').setup(require('config.alpha.theme').config)

		require('which-key').add({
			{ '<leader>d', '<cmd>Alpha<CR>', desc = 'Open Dashboard' },
		})

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
