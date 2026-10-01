return {
	{
		"williamboman/mason.nvim",
		enabled = require('config.util').not_vscode,
		lazy = true,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		enabled = require('config.util').not_vscode,
		lazy = true,
	},
	{
		'neovim/nvim-lspconfig',
		enabled = require('config.util').not_vscode,
		event = 'VeryLazy',
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",

			"j-hui/fidget.nvim",

			'nvim-lua/lsp-status.nvim',
			'RishabhRD/nvim-lsputils',
			'nvimdev/lspsaga.nvim',
			'kosayoda/nvim-lightbulb',
			'roobert/action-hints.nvim',
			'folke/trouble.nvim',

			'lukas-reineke/lsp-format.nvim',
		},
		config = function()
			local lsp_format = require('lsp-format')

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}

			vim.lsp.config('*', {
				capabilities = capabilities,
				on_attach = lsp_format.on_attach,
			})

			vim.lsp.config("emmet_language_server", {
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"pug",
					"typescriptreact"
				},
			})

			vim.lsp.config("angularls", {
				capabilities = capabilities,
				on_attach = lsp_format.on_attach,
				settings = {
					angular = {
						completeFunctionCalls = true,
					},
				},
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				on_attach = lsp_format.on_attach,
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

			vim.lsp.config("gopls", {
				capabilities = capabilities,
				on_attach = lsp_format.on_attach,
				settings = {
					gopls = {
						usePlaceholders = true,
						gofumpt = true,
					},
				},
			})

			vim.lsp.config("pylyzer", {
				capabilities = capabilities,
				settings = {},
			})

			vim.lsp.config("templ", {})

			require("fidget").setup({})
		end
	},
	-- { 'jmbuhr/otter.nvim', dependencies = {'nvim-treesitter/nvim-treesitter'}, opts = {} },
}
