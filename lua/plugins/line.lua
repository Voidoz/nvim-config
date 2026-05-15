return {
	{
		'nvim-lualine/lualine.nvim',
		enabled = require('config.vscode.enabled').never,
		event = 'VeryLazy',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
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

			local function buf_color(buffer)
				return buffer.is_focused and "PmenuSel" or "Pmenu"
			end

			local function tab_color(tabpage)
				return tabpage.is_active and "PmenuSel" or "Pmenu"
			end

			local fill_hl = "TabLineFill"

			require('cokeline').setup {
				default_hl = {
					fg = buf_color,
					bg = buf_color,
				},

				fill_hl = fill_hl,

				components = {
					{
						text = ' ',
						bg = fill_hl,
					},
					{
						text = '',
						fg = function(buffer) return hl_attr(buf_color(buffer), 'bg') end,
						bg = fill_hl,
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
						bg = fill_hl,
					},
				},

				tabs = {
					placement = 'right',
					components = {
						{
							text = '',
							fg = function(tabpage) hl_attr(tab_color(tabpage), 'bg') end,
							bg = fill_hl,
						},
						{
							text = function(tabpage) return 'Tab ' .. tabpage.number end,
							bold = function(tabpage) return tabpage.is_active end,
							fg = tab_color,
							bg = function(tabpage) hl_attr(tab_color(tabpage), 'bg') end,
						},
						{
							text = '',
							fg = function(tabpage) hl_attr(tab_color(tabpage), 'bg') end,
							bg = fill_hl,
						},
						{
							text = ' ',
							bg = fill_hl,
						},
					},
				},
			}
		end,
	},
}
