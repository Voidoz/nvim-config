return {
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
	config = function()
		local wk = require('which-key')
		wk.add({
			{ '<leader>l',                      desc = 'Lazy'    },
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		})
	end,
}
