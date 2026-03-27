return {
	{
		"lewis6991/gitsigns.nvim",
		enabled = require('config.vscode.enabled').never,
		event = { "BufReadPre", "BufNewFile" },
		init = function()
			require('config.mappings').gitsigns()
		end,
		opts = {
			signs = {
				add          = { text = '┃' },
				change       = { text = '┃' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 500,
			},
		},
	},
	{
		"kdheepak/lazygit.nvim",
		enabled = require('config.vscode.enabled').never,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		init = function()
			require('config.mappings').lazygit()
		end,
		config = true,
	},
}
