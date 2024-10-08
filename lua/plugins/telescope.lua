local lead = '<leader>f'

return {
    'nvim-telescope/telescope.nvim',
    enabled = require('config.vscode.enabled').never,
    lazy = false,
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    config = function ()
        local wk = require('which-key')

        wk.add({
            { lead,                                         group = 'Telescope' },
            { lead .. 't', '<cmd>Telescope<CR>',            desc = 'All' },
            { lead .. 'f', '<cmd>Telescope find_files<CR>', desc = 'Files' },
            { lead .. 'd', '<cmd>Telescope fd<CR>',         desc = 'Directories' },
            { lead .. 'g', '<cmd>Telescope live_grep<CR>',  desc = 'Text' },
            { lead .. 'b', '<cmd>Telescope buffers<CR>',    desc = 'Buffers'},
        })

        require('telescope').setup({})
    end,
}
