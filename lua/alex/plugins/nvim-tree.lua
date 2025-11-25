return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
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
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-------------------------------------------------------------------------
		-- DEVICONS: override colors for earthy palette
		-------------------------------------------------------------------------
		local devicons = require("nvim-web-devicons")
		devicons.set_icon({
			default = { icon = "", color = "#D5C4A1", name = "Default" }, -- beige
			lua = { icon = "", color = "#83A598", name = "Lua" }, -- muted teal
			py = { icon = "", color = "#B8BB26", name = "Python" }, -- moss green
			md = { icon = "", color = "#FABD2F", name = "Markdown" }, -- golden yellow
			js = { icon = "", color = "#FE8019", name = "JavaScript" }, -- earthy orange
			-- add more filetypes as needed
		})

		-------------------------------------------------------------------------
		-- TRANSPARENCY & EARTHY COLORS
		-------------------------------------------------------------------------
		local function set_nvimtree_earthy()
			vim.cmd([[
        " Transparent background
        highlight NvimTreeNormal guibg=none guifg=#D5C4A1
        highlight NvimTreeNormalNC guibg=none guifg=#D5C4A1
        highlight NvimTreeEndOfBuffer guibg=none guifg=#928374
        highlight NvimTreeVertSplit guibg=none guifg=#7C6F64
        highlight NvimTreeWinSeparator guibg=none guifg=#7C6F64

        " Folders and files
        highlight NvimTreeFolderName guifg=#FABD2F
        highlight NvimTreeOpenedFolderName guifg=#FABD2F
        highlight NvimTreeFolderIcon guifg=#FABD2F
        highlight NvimTreeFileName guifg=#D5C4A1
        highlight NvimTreeFileIcon guifg=#D5C4A1
        highlight NvimTreeExecFile guifg=#83A598

        " Git status
        highlight NvimTreeGitDirty guifg=#FB4934
        highlight NvimTreeGitStaged guifg=#B8BB26
        highlight NvimTreeGitRenamed guifg=#B16286
        highlight NvimTreeGitDeleted guifg=#FB4934
        highlight NvimTreeGitNew guifg=#FABD2F
        highlight NvimTreeGitIgnored guifg=#504945
      ]])
		end

		-- Apply immediately
		set_nvimtree_earthy()

		-- Reapply after changing colorschemes
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = set_nvimtree_earthy,
		})

		-------------------------------------------------------------------------
		-- KEYMAPS
		-------------------------------------------------------------------------
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		)
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end,
}
