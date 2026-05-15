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
			local hl_attr = require('cokeline.hlgroups').get_hl_attr

			local buf_color = function(buffer)
				return buffer.is_focused and "TabLineSel" or "TabLine"
			end

			require('cokeline').setup {
				default_hl = {
					fg = buf_color,
					bg = buf_color,
				},

				components = {
					{
						text = ' ',
						bg = "TabLineFill",
					},
					{
						text = '',
						fg = function(buffer)
							return hl_attr(buf_color(buffer), 'bg')
						end,
						bg = "TabLineFill",
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
						fg = hl_attr('Comment', 'fg'),
						italic = true,
					},
					{
						text = function(buffer) return buffer.filename .. ' ' end,
						bold = function(buffer) return buffer.is_focused end,
					},
					{
						text = '󰅚',
						delete_buffer_on_left_click = true,
					},
					{
						text = '',
						fg = function(buffer)
							return hl_attr(buf_color(buffer), 'bg')
						end,
						bg = "TabLineFill",
					},
				},

				tabs = {
					placement = 'right',
					components = {
						{
							text = '',
							fg = function(tabpage)
								return
									tabpage.is_active
									and hl_attr('TabLineSel', 'bg')
									or hl_attr('TabLine', 'bg')
							end,
							bg = "TabLineFill",
						},
						{
							text = function(tabpage) return 'Tab ' .. tabpage.number end,
							bold = function(tabpage) return tabpage.is_active end,
							fg = function(tabpage)
								return
									tabpage.is_active
									and "TabLineSel"
									or "TabLine"
							end,
							bg = function(tabpage)
								return
									tabpage.is_active
									and 'TabLineSel'
									or 'TabLine'
							end,
						},
						{
							text = '',
							fg = function(tabpage)
								return
									tabpage.is_active
									and hl_attr('TabLineSel', 'bg')
									or hl_attr('TabLine', 'bg')
							end,
							bg = "TabLineFill",
						},
						{
							text = ' ',
							bg = "TabLineFill",
						},
					},
				},
			}
		end,
	},
}
