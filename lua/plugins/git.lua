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
	init = function()
		require('config.mappings').lazygit()
	end,
	config = true,
}
