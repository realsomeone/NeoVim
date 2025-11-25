return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false, -- disable right-hand suggestion panel
			},
			suggestion = {
				enabled = true,
				auto_trigger = false, -- only show when manually requested
				debounce = 75,
				keymap = {
					accept = "<C-l>", -- accept suggestion
					next = "<C-]>", -- next suggestion
					prev = "<C-[>", -- previous suggestion
					dismiss = "<C-e>", -- dismiss suggestion
				},
			},
			filetypes = {
				markdown = true,
				help = false,
				gitcommit = true,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = true, -- enable for all other filetypes
			},
			copilot_node_command = "node", -- ensure Node.js >= 18
			server_opts_overrides = {},
		})

		-- Optional keymap: toggle Copilot suggestions on/off
		vim.api.nvim_set_keymap(
			"n",
			"<leader>cp",
			"<cmd>Copilot toggle<CR>",
			{ noremap = true, silent = true, desc = "Toggle GitHub Copilot" }
		)

		-- Small status indicator in command line
		vim.api.nvim_create_autocmd("User", {
			pattern = "CopilotEnabled",
			callback = function()
				vim.notify(" Copilot enabled", vim.log.levels.INFO, { title = "GitHub Copilot" })
			end,
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = "CopilotDisabled",
			callback = function()
				vim.notify(" Copilot disabled", vim.log.levels.WARN, { title = "GitHub Copilot" })
			end,
		})
	end,
}
