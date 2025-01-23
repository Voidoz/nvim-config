return {
	'kevinhwang91/nvim-ufo',
	event = 'VeryLazy',
	dependencies = { 'kevinhwang91/promise-async' },
	config = function()
		vim.o.foldcolumn = '1'
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		require('config.mappings').folding()

		require('ufo').setup()
	end,
}
