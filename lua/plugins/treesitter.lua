return {
    'nvim-treesitter/nvim-treesitter',
    enabled = require('config.vscode.enabled').never,
    config = function ()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                -- "dart",
            },
            -- auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                -- enable = true,
            },
        }
    end
}