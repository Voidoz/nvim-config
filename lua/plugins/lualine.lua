return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    otps = {
        options = {
            disabled_filetypes = {
                filesystem = {},
                alpha = {},
            },
        },
    },
}