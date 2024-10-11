return {
	'akinsho/flutter-tools.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'stevearc/dressing.nvim',
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local dartExcludedFolders = {
			vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
			vim.fn.expand("$HOME/.pub-cache"),
			vim.fn.expand("/opt/homebrew/"),
			vim.fn.expand("$HOME/tools/flutter/"),
		}

		require('flutter-tools').setup {
			debugger = {
				enabled = true,
				register_configurations = function(_)
					require("dap.ext.vscode").load_launchjs()
				end,
			},
			lsp = {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					local ec_max_line_len = vim.o.textwidth
					if (ec_max_line_len > 0) then
						client.config.settings.dart.lineLength = ec_max_line_len
					end

					require('lsp-format').on_attach(client, bufnr)
				end,
				settings = {
					analysisExcludedFolders = dartExcludedFolders,
					updateImportsOnRename = true,
					completeFunctionCalls = true,
					showTodos = true,
					enableSnippets = true,
				},
			},
		}
	end,
}
