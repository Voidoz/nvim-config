return {
    {
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
	},
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",

			"j-hui/fidget.nvim",

            'nvim-lua/lsp-status.nvim',
            'RishabhRD/nvim-lsputils',
            'nvimdev/lspsaga.nvim',
            'kosayoda/nvim-lightbulb',
            'roobert/action-hints.nvim',
            'folke/trouble.nvim',
        },
        config = function ()
            local lsp_config = require('lspconfig')
            require("mason").setup()
            require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local dartExcludedFolders = {
				vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
				vim.fn.expand("$HOME/.pub-cache"),
				vim.fn.expand("/opt/homebrew/"),
				vim.fn.expand("$HOME/tools/flutter/"),
			}

            lsp_config.dartls.setup({
                capabilities,
                cmd = {
					"dart",
					"language-server",
					"--protocol=lsp",
				},
				filetypes = { "dart" },
				init_options = {
					onlyAnalyzeProjectsWithOpenFiles = false,
					suggestFromUnimportedLibraries = true,
					closingLabels = true,
					outline = false,
					flutterOutline = false,
				},
				settings = {
					dart = {
						analysisExcludedFolders = dartExcludedFolders,
						updateImportsOnRename = true,
						completeFunctionCalls = true,
						showTodos = true,
					},
				},
            })

            lsp_config.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
                        -- runtime = {
                        --   version = "LuaJIT",
                        -- },
						diagnostics = {
							globals = { "vim" },
						},
                        -- workspace = {
                        --   checkThirdParty = false,
                        --   library = {
                        --     '${3rd}/luv/library',
                        --     unpack(vim.api.nvim_get_runtime_rile("", true)),
                        --     vim.api.nvim_get_proc,
                        --   }
                        -- },
					},
				},
			})

            require("fidget").setup({})
        end
    },
    -- { 'jmbuhr/otter.nvim', dependencies = {'nvim-treesitter/nvim-treesitter'}, opts = {} },
}