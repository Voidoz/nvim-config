return {
	"pmizio/typescript-tools.nvim",
	enabled = require('config.vscode.enabled').never,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
	},
	ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	config = function()
		local lsp_format = require('lsp-format')
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		require("typescript-tools").setup({
			capabilities = capabilities,
			on_attach = lsp_format.on_attach,
			settings = {
				expose_as_code_action = "all",
				complete_function_calls = true,
				jsx_close_tag = {
					enable = true,
					filetypes = { "javascriptreact", "typescriptreact" },
				},
			},
		})
	end,
}
