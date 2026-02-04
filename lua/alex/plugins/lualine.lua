return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		local colors = {
			bg = "#070320",
			bg_dark = "#09052E",
			fg = "#F4F0F0",
			fg_dark = "#D5C3C3",
			mode_sage = "#6A956B",
			mode_clay = "#C08972",
			mode_golden = "#FFA600",
			mode_orange = "#996300",
			mode_dust = "#AA8888",
			inactive_bg = "#09052E",
			inactive_fg = "#5A3F3F",
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.mode_sage, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg_dark, fg = colors.fg },
				c = { bg = colors.bg_dark, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.mode_clay, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg_dark, fg = colors.fg },
				c = { bg = colors.bg_dark, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.mode_golden, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg_dark, fg = colors.fg },
				c = { bg = colors.bg_dark, fg = colors.fg },
			},
			command = {
				a = { bg = colors.mode_orange, fg = colors.fg, gui = "bold" },
				b = { bg = colors.bg_dark, fg = colors.fg },
				c = { bg = colors.bg_dark, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.mode_dust, fg = colors.bg, gui = "bold" },
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
						color = { fg = "#FFA600" },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
