return {
	{
		'mfussenegger/nvim-dap',
		enabled = require('config.vscode.enabled').never,
		event = 'VeryLazy',
	},
	{
		"rcarriga/nvim-dap-ui",
		event = 'VeryLazy',
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
	},
}
