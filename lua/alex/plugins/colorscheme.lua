return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			-- Earthy forest palette from your wallpaper
			local bg = "#070320" -- Black-950
			local bg_dark = "#09052E" -- Black-900
			local bg_highlight = "#1E1515" -- Dust-grey-900
			local bg_search = "#FFA600" -- Golden-orange-500
			local bg_visual = "#2A3C2B" -- Sage-green-800
			local fg = "#F4F0F0" -- Dust-grey-50
			local fg_dark = "#D5C3C3" -- Dust-grey-200
			local fg_gutter = "#5A3F3F" -- Dust-grey-700
			local border = "#3F5A40" -- Sage-green-700

			require("tokyonight").setup({
				style = "night",
				transparent = true,
				on_colors = function(colors)
					-- Background colors
					colors.bg = bg
					colors.bg_dark = bg_dark
					colors.bg_float = bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = bg_dark
					colors.bg_statusline = bg_dark
					colors.bg_visual = bg_visual

					-- Border & UI
					colors.border = border

					-- Foreground/text
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark

					-- Override tokyonight's default accent colors with earthy palette
					colors.blue = "#6A956B" -- Sage-green-500 (replaces blue)
					colors.cyan = "#88AA88" -- Sage-green-400 (replaces cyan)
					colors.green = "#A5C0A6" -- Sage-green-300 (replaces green)
					colors.magenta = "#AA8888" -- Dust-grey-400 (replaces magenta)
					colors.orange = "#C08972" -- Clay-soil-400 (replaces orange)
					colors.red = "#B06C4F" -- Clay-soil-500 (replaces red)
					colors.yellow = "#FFA600" -- Golden-orange-500 (replaces yellow)
					colors.purple = "#956A6A" -- Dust-grey-500 (replaces purple)
				end,
				on_highlights = function(hl, c)
					-- Syntax highlighting
					hl.Comment = { fg = "#A5C0A6", italic = true } -- Sage-green-300
					hl.Identifier = { fg = "#C08972" } -- Clay-soil-400
					hl.String = { fg = "#C08972" } -- Clay-soil-400
					hl.Keyword = { fg = "#FFC966", bold = false } -- Golden-orange-300
					hl.Function = { fg = "#F4F0F0" } -- Dust-grey-50
					hl.Type = { fg = "#88AA88" } -- Sage-green-400
					hl.Special = { fg = "#FFA600" } -- Golden-orange-500

					-- Ensure statusline uses correct colors (prevent tokyonight override)
					hl.StatusLine = { bg = bg_dark, fg = fg }
					hl.StatusLineNC = { bg = bg_dark, fg = fg_gutter }
				end,
			})

			vim.cmd([[colorscheme tokyonight]])

			-- Force additional highlight overrides after colorscheme loads
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "tokyonight",
				callback = function()
					-- Ensure lualine mode colors stay earthy (prevent tokyonight override)
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
