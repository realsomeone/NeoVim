return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- Earthy forest palette matching your wallpaper
		local colors = {
			bg = "#070320", -- Black-950 (main background)
			bg_dark = "#09052E", -- Black-900 (darker sections)
			fg = "#F4F0F0", -- Dust-grey-50 (main text)
			fg_dark = "#D5C3C3", -- Dust-grey-200 (secondary text)

			-- Mode indicator colors (earthy palette)
			mode_sage = "#6A956B", -- Sage-green-500 (NORMAL)
			mode_clay = "#C08972", -- Clay-soil-400 (INSERT)
			mode_golden = "#FFA600", -- Golden-orange-500 (VISUAL)
			mode_orange = "#996300", -- Golden-orange-700 (COMMAND)
			mode_dust = "#AA8888", -- Dust-grey-400 (REPLACE)

			inactive_bg = "#09052E", -- Black-900
			inactive_fg = "#5A3F3F", -- Dust-grey-700
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.mode_sage, fg = colors.bg, gui = "bold" }, -- NORMAL: sage green
				b = { bg = colors.bg_dark, fg = colors.fg },
				c = { bg = colors.bg_dark, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.mode_clay, fg = colors.bg, gui = "bold" }, -- INSERT: clay orange
				b = { bg = colors.bg_dark, fg = colors.fg },
				c = { bg = colors.bg_dark, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.mode_golden, fg = colors.bg, gui = "bold" }, -- VISUAL: golden orange
				b = { bg = colors.bg_dark, fg = colors.fg },
				c = { bg = colors.bg_dark, fg = colors.fg },
			},
			command = {
				a = { bg = colors.mode_orange, fg = colors.fg, gui = "bold" }, -- COMMAND: deep orange
				b = { bg = colors.bg_dark, fg = colors.fg },
				c = { bg = colors.bg_dark, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.mode_dust, fg = colors.bg, gui = "bold" }, -- REPLACE: dusty grey
				b = { bg = colors.bg_dark, fg = colors.fg },
				c = { bg = colors.bg_dark, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.inactive_fg, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.inactive_fg },
				c = { bg = colors.inactive_bg, fg = colors.inactive_fg },
			},
		}

		lualine.setup({
			options = {
				theme = my_lualine_theme,
				globalstatus = true,
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#FFA600" }, -- Golden-orange-500 for updates
					},
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
