local lead = '<leader>f'

return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        { lead,                                         desc = 'Telescope' },
        { lead .. 't', '<cmd>Telescope<CR>',            desc = 'All' },
        { lead .. 'f', '<cmd>Telescope find_files<CR>', desc = 'Files' },
        { lead .. 'd', '<cmd>Telescope fd<CR>',         desc = 'Directories' },
        { lead .. 'g', '<cmd>Telescope live_grep<CR>',  desc = 'Text' },
        { lead .. 'b', '<cmd>Telescope buffers<CR>',    desc = 'Buffers'},
    },
}
