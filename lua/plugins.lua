return {
    -- Session
    { 'rmagatti/auto-session' },

    -- Search
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x' },

    -- Dashboard
    { 'goolord/alpha-nvim' },

    -- Notifications
    { 'rcarriga/nvim-notify', version = '^3' },
    { "j-hui/fidget.nvim", opts = {} },

    -- File Explorer
    { 'stevearc/oil.nvim' },
    
    -- Terminal
    { 'akinsho/toggleterm.nvim', version = "*" },

    -- Git
    { 'kdheepak/lazygit.nvim' },

    -- UI
    { 'stevearc/dressing.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },

    -- LSP
    { 'neovim/nvim-lspconfig' },
    { 'nvim-lua/lsp-status.nvim' },
    { 'RishabhRD/nvim-lsputils' },
    { 'nvimdev/lspsaga.nvim' },
    { 'kosayoda/nvim-lightbulb' },
    { 'roobert/action-hints.nvim' },
    { 'folke/trouble.nvim' },
    { 'williamboman/mason.nvim', config = true },
    -- { 'jmbuhr/otter.nvim', dependencies = {'nvim-treesitter/nvim-treesitter'}, opts = {} },

    -- Completion
    { 'hrsh7th/nvim-cmp' },

    -- Syntax Highlighting
    { 'dart-lang/dart-vim-plugin' },
    { 'akinsho/flutter-tools.nvim', lazy = false },

    -- Debugger
    { "mfussenegger/nvim-dap" },
}