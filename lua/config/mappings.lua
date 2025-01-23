local wk = require('which-key')

local function cb(modname, fn)
	return function()
		require(modname)[fn]()
	end
end

local M = {}

M.default = function()
	wk.add({
		{ '<leader>c',  group = 'Code' },
		{ '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', desc = 'Action' },
	})
end

M.docsview = function()
	wk.add({ '<leader>d', group = 'Docs' })
	wk.add({ '<leader>dt', '<cmd>DocsViewToggle<CR>', desc = 'Toggle' })
	wk.add({ '<leader>du', '<cmd>DocsViewUpdate<CR>', desc = 'Update' })
end

-- M.alpha = function()
-- 	wk.add({
-- 		{ '<leader>d', '<cmd>Alpha<CR>', desc = 'Open Dashboard' },
-- 	})
-- end

M.folding = function()
	wk.add({
		{ 'zR', require('ufo').openAllFolds,  desc = 'Open all folds',  mode = { 'n' } },
		{ 'zM', require('ufo').closeAllFolds, desc = 'Close all folds', mode = { 'n' } },
	})
end

M.oil = function()
	wk.add({
		{ '<leader>o', '<cmd>Oil<CR>', desc = 'Open Oil' }
	})
end

M.lazygit = function()
	wk.add({
		{ '<leader>l',  desc = 'Lazy' },
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	})
end

M.resession = function()
	wk.add({
		{ '<leader>s',  group = 'Session' },
		{ '<leader>ss', cb('resession', 'save'),   desc = 'Save Session' },
		{ '<leader>sl', cb('resession', 'load'),   desc = 'Load Session' },
		{ '<leader>sd', cb('resession', 'delete'), desc = 'Delete Session' },
	})
end

M.telescope = function()
	wk.add({
		{ '<leader>f',  group = 'Telescope' },
		{ '<leader>ft', '<cmd>Telescope<CR>',            desc = 'All' },
		{ '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Files' },
		{ '<leader>fd', '<cmd>Telescope fd<CR>',         desc = 'Directories' },
		{ '<leader>fg', '<cmd>Telescope live_grep<CR>',  desc = 'Text' },
		{ '<leader>fb', '<cmd>Telescope buffers<CR>',    desc = 'Buffers' },
	})
end

-- M.toggleterm = function()
-- 	wk.add({
-- 		{ '<leader>t',  group = 'Terminal' },
-- 		{ '<leader>tf', '<cmd>ToggleTerm direction=float<CR>',      desc = 'Open Float' },
-- 		--{ '<leader>to', '<cmd>ToggleTerm<CR>',                      desc = 'Open'            },
-- 		{ '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>',   desc = 'Open Vertical' },
-- 		{ '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', desc = 'Open Horizontal' },
-- 		{ '<leader>tn', '<cmd>ToggleTermSetName<CR>',               desc = 'Set Name' },
-- 		{ '<leader>ts', '<cmd>TermSelect<CR>',                      desc = 'Select' },
-- 	})
-- end

return M
