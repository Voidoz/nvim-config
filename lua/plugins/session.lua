return {
  'rmagatti/auto-session',
  enabled = require('config.vscode.enabled').never,
  dependencies = { 'folke/which-key.nvim' },
  config = function()
    require('auto-session').setup({
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
      bypass_save_filetypes = { 'alpha' },
      auto_restore_last_session = false,
      auto_create = false,
    })

    local wk = require('which-key')

    wk.add({
      { '<leader>s', group = 'Session' },
      { '<leader>sr', '<cmd>SessionRestore<CR>',        desc = 'Session restore' },
      { '<leader>sf', '<cmd>SessionSearch<CR>',         desc = 'Session search' },
      { '<leader>ss', '<cmd>SessionSave<CR>',           desc = 'Save session' },
      { '<leader>sa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
    })
  end,
}
