return {
	"amrbashir/nvim-docs-view",
	lazy = true,
	cmd = "DocsViewToggle",
	init = function()
		require('config.keymaps').docsview()
	end,
	opts = {
		position = "bottom",
	}
}
