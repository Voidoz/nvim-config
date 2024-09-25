return {
  'rmagatti/auto-session',
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    bypass_save_filetypes = { 'dashboard' },
    auto_restore_last_session = false,
    auto_create = false,
  },
}