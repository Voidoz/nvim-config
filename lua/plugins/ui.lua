return {
    {
        'rcarriga/nvim-notify',
        enabled = require('config.vscode.enabled').never,
        version = '^3',
    },
    {
        'stevearc/dressing.nvim',
        enabled = require('config.vscode.enabled').never,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
        opts = {},
    },
    {
        "folke/tokyonight.nvim",
        enabled = require('config.vscode.enabled').never,
        lazy = false,
        priority = 1000,
		config = function()
			require('tokyonight').setup({ style = "night" })
		end,
    },
}
