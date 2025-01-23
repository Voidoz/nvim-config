return {
	{
		"williamboman/mason.nvim",
		enabled = require('config.vscode.enabled').never,
		lazy = true,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		enabled = require('config.vscode.enabled').never,
		lazy = true,
	},
	{
		'neovim/nvim-lspconfig',
		enabled = require('config.vscode.enabled').never,
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
			local lsp_config = require('lspconfig')
			local lsp_format = require('lsp-format')

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					-- "gopls",
					-- "pylyzer",
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}

			lsp_config.emmet_language_server.setup({
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

			-- local dartExcludedFolders = {
			-- 	vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
			-- 	vim.fn.expand("$HOME/.pub-cache"),
			-- 	vim.fn.expand("/opt/homebrew/"),
			-- 	vim.fn.expand("$HOME/tools/flutter/"),
			-- }
			--
			-- lsp_config.dartls.setup({
			-- 	capabilities,
			-- 	on_attach = function(client, bufnr)
			-- 		local ec_max_line_len = vim.o.textwidth
			-- 		if (ec_max_line_len > 0) then
			-- 			client.config.settings.dart.lineLength = ec_max_line_len
			-- 		end
			--
			-- 		lsp_format.on_attach(client, bufnr)
			-- 	end,
			-- 	cmd = {
			-- 		"dart",
			-- 		"language-server",
			-- 		"--protocol=lsp",
			-- 	},
			-- 	filetypes = { "dart" },
			-- 	init_options = {
			-- 		onlyAnalyzeProjectsWithOpenFiles = false,
			-- 		suggestFromUnimportedLibraries = true,
			-- 		closingLabels = true,
			-- 		outline = false,
			-- 		flutterOutline = false,
			-- 	},
			-- 	settings = {
			-- 		dart = {
			-- 			analysisExcludedFolders = dartExcludedFolders,
			-- 			updateImportsOnRename = true,
			-- 			completeFunctionCalls = true,
			-- 			showTodos = true,
			-- 		},
			-- 	},
			-- })

			lsp_config.lua_ls.setup({
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

			lsp_config.gopls.setup({
				capabilities = capabilities,
				on_attach = lsp_format.on_attach,
				settings = {
					gopls = {
						usePlaceholders = true,
						gofumpt = true,
					},
				},
			})

			lsp_config.pylyzer.setup({
				capabilities = capabilities,
				settings = {},
			})

			lsp_config.templ.setup({})

			require("fidget").setup({})
		end
	},
	-- { 'jmbuhr/otter.nvim', dependencies = {'nvim-treesitter/nvim-treesitter'}, opts = {} },
}
