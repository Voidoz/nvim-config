local lead = '<leader>t'

return {
    'akinsho/toggleterm.nvim',
    enabled = require('config.vscode.enabled').never,
    lazy = false,
    version = "*",
	config = function()
		require('toggleterm').setup{}

		local wk = require('which-key')
		wk.add({
			{ lead,                                                    group = 'Terminal'       },
			{ lead .. 'f', '<cmd>ToggleTerm direction=float<CR>',      desc = 'Open Float'      },
			--{ lead .. 'o', '<cmd>ToggleTerm<CR>',                      desc = 'Open'            },
			{ lead .. 'v', '<cmd>ToggleTerm direction=vertical<CR>',   desc = 'Open Vertical'   },
			{ lead .. 'h', '<cmd>ToggleTerm direction=horizontal<CR>', desc = 'Open Horizontal' },
			{ lead .. 'n', '<cmd>ToggleTermSetName<CR>',               desc = 'Set Name'        },
			{ lead .. 's', '<cmd>TermSelect<CR>',                      desc = 'Select'          },
		})
	end,
}
