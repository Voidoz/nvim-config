return {
	"amrbashir/nvim-docs-view",
	lazy = true,
	cmd = "DocsViewToggle",
	init = function()
		require('config.mappings').docsview()
	end,
	opts = {
		position = "bottom",
	}
}
