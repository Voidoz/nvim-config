local lead = '<leader>t'

return {
    'akinsho/toggleterm.nvim',
    lazy = true,
    version = "*",
    opts = {},
    keys = {
        { lead, desc = 'Terminal' },
        { lead .. 'f', '<cmd>ToggleTerm<CR>', desc = 'Open Float' },
        { lead .. 'o', '<cmd>ToggleTerm<CR>', desc = 'Open' },
        { lead .. 'v', '<cmd>ToggleTerm direction=vertical<CR>', desc = 'Open Vertical' },
        { lead .. 'h', '<cmd>ToggleTerm direction=horizontal<CR>', desc = 'Open Horizontal' },
        { lead .. 'n', '<cmd>ToggleTermSetName<CR>', desc = 'Set Name' },
        { lead .. 's', '<cmd>TermSelect<CR>', desc = 'Select' },
    },
}