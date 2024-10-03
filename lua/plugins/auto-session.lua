return {
  'rmagatti/auto-session',
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    bypass_save_filetypes = { 'alpha' },
    auto_restore_last_session = false,
    auto_create = false,
  },
  keys = {
    { '<leader>s',                                    desc = 'Session' },
    { '<leader>sr', '<cmd>SessionRestore<CR>',        desc = 'Session restore' },
    { '<leader>sf', '<cmd>SessionSearch<CR>',         desc = 'Session search' },
    { '<leader>ss', '<cmd>SessionSave<CR>',           desc = 'Save session' },
    { '<leader>sa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
  },
}