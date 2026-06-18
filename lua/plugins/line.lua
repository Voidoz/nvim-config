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
				},
				theme = 'auto',
				component_separators = '|',
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = {
					{ 'mode', separator = { left = '' }, right_padding = 2 },
				},
				lualine_b = { 'filename', 'branch' },
				lualine_c = { '%=', }, -- centers the middle components
				lualine_x = {},
				lualine_y = { 'filetype', 'progress' },
				lualine_z = {
					{ 'location', separator = { right = '' }, left_padding = 2 },
				},
			},
		},
	},
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"catppuccin/nvim",
		},
		config = function()
			local palette     = require("catppuccin.palettes").get_palette()

			local fill_bg     = palette.mantle
			local active_bg   = palette.surface1
			local inactive_bg = palette.surface0
			local inactive_fg = palette.subtext0
			local accent_fg   = palette.lavender
			local comment_fg  = palette.overlay1
			local modified_fg = palette.yellow
			local close_fg    = palette.red

			vim.api.nvim_set_hl(0, "CokelineFill", { bg = fill_bg, fg = fill_bg })

			local function buf_bg(buffer)
				return buffer.is_focused and active_bg or inactive_bg
			end

			local function buf_fg(buffer)
				return buffer.is_focused and palette.text or inactive_fg
			end

			local function tab_bg(tabpage)
				return tabpage.is_active and active_bg or inactive_bg
			end

			require('cokeline').setup {
				default_hl = {
					fg = buf_fg,
					bg = buf_bg,
				},

				fill_hl = "CokelineFill",

				components = {
					{
						text = ' ',
						bg = fill_bg,
					},
					{
						text = '',
						fg = buf_bg,
						bg = fill_bg,
					},
					{
						text = function(buffer) return ' ' .. buffer.devicon.icon end,
						fg = function(buffer)
							return buffer.is_focused and buffer.devicon.color or comment_fg
						end,
					},
					{
						text = ' ',
					},
					{
						text = function(buffer) return buffer.unique_prefix end,
						fg = comment_fg,
						italic = true,
					},
					{
						text = function(buffer) return buffer.filename end,
						bold = function(buffer) return buffer.is_focused end,
						fg = function(buffer)
							return buffer.is_focused and accent_fg or inactive_fg
						end,
					},
					{
						text = ' ',
					},
					{
						text = function(buffer)
							return buffer.is_modified and '● ' or '󰅚 '
						end,
						fg = function(buffer)
							if buffer.is_modified then return modified_fg end
							return buffer.is_focused and close_fg or comment_fg
						end,
						delete_buffer_on_left_click = true,
					},
					{
						text = '',
						fg = buf_bg,
						bg = fill_bg,
					},
				},

				tabs = {
					placement = 'right',
					components = {
						{
							text = '',
							fg = tab_bg,
							bg = fill_bg,
						},
						{
							text = function(tabpage) return ' 󰓩 ' .. tabpage.number .. ' ' end,
							bold = function(tabpage) return tabpage.is_active end,
							fg = function(tabpage)
								return tabpage.is_active and accent_fg or inactive_fg
							end,
							bg = tab_bg,
						},
						{
							text = '',
							fg = tab_bg,
							bg = fill_bg,
						},
						{
							text = ' ',
							bg = fill_bg,
						},
					},
				},
			}
		end,
	},
}
