return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			local bg = "#070320"
			local bg_dark = "#09052E"
			local bg_highlight = "#1E1515"
			local bg_search = "#FFA600"
			local bg_visual = "#2A3C2B"
			local fg = "#F4F0F0"
			local fg_dark = "#D5C3C3"
			local fg_gutter = "#5A3F3F"
			local border = "#3F5A40"

			require("tokyonight").setup({
				style = "night",
				transparent = true,
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = bg_dark
					colors.bg_float = bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = bg_dark
					colors.bg_statusline = bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
					colors.blue = "#6A956B"
					colors.cyan = "#88AA88"
					colors.green = "#A5C0A6"
					colors.magenta = "#AA8888"
					colors.orange = "#C08972"
					colors.red = "#B06C4F"
					colors.yellow = "#FFA600"
					colors.purple = "#956A6A"
				end,
				on_highlights = function(hl, c)
					hl.Comment = { fg = "#A5C0A6", italic = true }
					hl.Identifier = { fg = "#C08972" }
					hl.String = { fg = "#C08972" }
					hl.Keyword = { fg = "#FFC966", bold = false }
					hl.Function = { fg = "#F4F0F0" }
					hl.Type = { fg = "#88AA88" }
					hl.Special = { fg = "#FFA600" }
					hl.StatusLine = { bg = bg_dark, fg = fg }
					hl.StatusLineNC = { bg = bg_dark, fg = fg_gutter }
				end,
			})

			vim.cmd([[colorscheme tokyonight]])

			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "tokyonight",
				callback = function()
					vim.cmd([[
						highlight lualine_a_normal guibg=#6A956B guifg=#070320 gui=bold
						highlight lualine_a_insert guibg=#C08972 guifg=#070320 gui=bold
						highlight lualine_a_visual guibg=#FFA600 guifg=#070320 gui=bold
						highlight lualine_a_command guibg=#996300 guifg=#F4F0F0 gui=bold
						highlight lualine_a_replace guibg=#AA8888 guifg=#070320 gui=bold
					]])
				end,
			})
		end,
	},
}
