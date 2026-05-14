return {
	{
		'nvim-lualine/lualine.nvim',
		enabled = require('config.vscode.enabled').never,
		event = 'VeryLazy',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				theme = "tokyonight",
				disabled_filetypes = {
					'alpha',
					'oil',
				},
			},
		},
	},
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local get_hex = require('cokeline.hlgroups').get_hl_attr

			local green = vim.g.terminal_color_2
			local yellow = vim.g.terminal_color_3

			require('cokeline').setup {
				default_hl = {
					fg = function(buffer)
						return
							buffer.is_focused
							and get_hex('Normal', 'fg')
							or get_hex('Comment', 'fg')
					end,
					bg = get_hex('ColorColumn', 'bg'),
				},

				components = {
					{
						text = '｜',
						fg = function(buffer)
							return
								buffer.is_modified and yellow or green
						end
					},
					{
						text = function(buffer) return buffer.devicon.icon .. ' ' end,
						fg = function(buffer) return buffer.devicon.color end,
					},
					{
						text = function(buffer) return buffer.number .. ': ' end,
					},
					{
						text = function(buffer) return buffer.unique_prefix end,
						fg = get_hex('Comment', 'fg'),
						italic = true,
					},
					{
						text = function(buffer) return buffer.filename .. ' ' end,
						bold = function(buffer) return buffer.is_focused end,
					},
					{
						text = ' ',
					},
				},

				tabs = {
					placement = 'right',
					components = {
						{
							text = '｜',
							fg = function()
								return green
							end
						},
						{
							text = function(tabpage) return 'Tab ' .. tabpage.number end,
							bold = function(tabpage) return tabpage.is_active end,
							fg = function(tabpage)
								return
									tabpage.is_active
									and get_hex('Normal', 'fg')
									or get_hex('Comment', 'fg')
							end,
							bg = get_hex('ColorColumn', 'bg'),
						},
						{
							text = ' ',
						},

					},
				},
			}
		end,
	},
}
