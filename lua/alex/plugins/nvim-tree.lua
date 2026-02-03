return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- required for nvim-tree replacing netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			renderer = {
				indent_markers = { enable = true },
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = { enable = false },
				},
			},
			filters = { custom = { ".DS_Store" } },
			git = { ignore = false },
		})

		-------------------------------------------------------------------------
		-- DEVICONS: forest palette
		-------------------------------------------------------------------------
		local devicons = require("nvim-web-devicons")
		devicons.set_icon({
			default = { icon = "", color = "#F4F0F0", name = "Default" }, -- fog-white
			lua = { icon = "", color = "#A5C0A6", name = "Lua" }, -- sage-300
			py = { icon = "", color = "#557755", name = "Python" }, -- sage-600
			md = { icon = "", color = "#FFC966", name = "Markdown" }, -- golden-300
			js = { icon = "", color = "#C08972", name = "JavaScript" }, -- clay-400
		})

		-------------------------------------------------------------------------
		-- HIGHLIGHTS (forest theme)
		-- All nvim-tree colors match your wallpaper + Neovim/Tokyonight theme
		-------------------------------------------------------------------------
		local function set_forest_colors()
			vim.cmd([[
        " === Core Text Colors ===
        highlight NvimTreeNormal guibg=none guifg=#F4F0F0      " main text (dust-grey-50)
        highlight NvimTreeNormalNC guibg=none guifg=#F4F0F0    " inactive tree text
        highlight NvimTreeFileName guifg=#F4F0F0               " file names
        highlight NvimTreeFileIcon guifg=#A5C0A6               " file icons (sage-300)

        " === Folder Colors ===
        highlight NvimTreeFolderName guifg=#A5C0A6             " folder names (sage-300)
        highlight NvimTreeOpenedFolderName guifg=#557755        " opened folder (sage-600)
        highlight NvimTreeFolderIcon guifg=#A5C0A6              " folder icon (sage-300)

        " === UI Elements ===
        highlight NvimTreeEndOfBuffer guibg=none guifg=#151e15  " deep forest shadow
        highlight NvimTreeVertSplit guibg=none guifg=#3F5A40    " vertical split (sage-700)
        highlight NvimTreeWinSeparator guibg=none guifg=#3F5A40 " window border (sage-700)

        " === Git Status Colors ===
        highlight NvimTreeGitDirty  guifg=#FFC966               " modified (golden-300)
        highlight NvimTreeGitStaged guifg=#6A956B               " staged (sage-500)
        highlight NvimTreeGitRenamed guifg=#C08972              " renamed (clay-400)
        highlight NvimTreeGitDeleted guifg=#B16286              " deleted (muted violet accent)
        highlight NvimTreeGitNew    guifg=#88AA88               " new file (sage-400)
        highlight NvimTreeGitIgnored guifg=#5A3F3F              " ignored (dust-grey-700)

        " === Executable / Special Files ===
        highlight NvimTreeExecFile guifg=#FFC966                " executable (golden-300)
      ]])
		end

		set_forest_colors()

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = set_forest_colors,
		})

		-------------------------------------------------------------------------
		-- KEYMAPS
		-------------------------------------------------------------------------
		local keymap = vim.keymap

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Find file in NvimTree" })
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse all" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" })
	end,
}
