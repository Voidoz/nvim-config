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
		-- enabled = require('config.vscode.enabled').never,
		enabled = false,
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
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			-- Only one of these is needed.
			"sindrets/diffview.nvim", -- optional
			-- "esmuellert/codediff.nvim", -- optional

			-- For a custom log pager
			"m00qek/baleia.nvim", -- optional

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			--"ibhagwan/fzf-lua",     -- optional
			--"nvim-mini/mini.pick",  -- optional
			--"folke/snacks.nvim",    -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
		}
	},
}
