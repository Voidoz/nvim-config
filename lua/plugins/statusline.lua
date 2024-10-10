return {
    'nvim-lualine/lualine.nvim',
    enabled = require('config.vscode.enabled').never,
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
}
