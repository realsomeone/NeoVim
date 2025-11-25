return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- LSP servers only
		mason_lspconfig.setup({
			ensure_installed = {
				"clangd",
				"lua_ls",
				"pyright",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"graphql",
				"emmet_ls",
				"prismals",
			},
		})

		-- Tools for formatting/linters
		mason_tool_installer.setup({
			ensure_installed = {
				"stylua", -- Lua formatter
				"black", -- Python formatter
				"isort", -- Python import sorter
				"prettier", -- JS/TS/HTML/CSS
				"pylint", -- Python linter
				"eslint_d", -- JS/TS linter
			},
		})
	end,
}
