return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		-- Diagnostics
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = { border = "rounded", source = "always", header = "", prefix = "" },
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- LSP keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				keymap.set("n", "<leader>d", function()
					vim.diagnostic.open_float(nil, { focus = false })
				end, opts)
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Setup installed servers using new vim.lsp.config API
		for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
			local config = {
				name = server_name,
				cmd = vim.lsp.config[server_name] and vim.lsp.config[server_name].cmd or { server_name },
				root_markers = vim.lsp.config[server_name] and vim.lsp.config[server_name].root_markers or nil,
				capabilities = capabilities,
			}

			if server_name == "lua_ls" then
				config.settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				}
			elseif server_name == "clangd" then
				config.cmd = { "clangd", "--header-insertion=never", "--background-index" }
				config.init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true,
				}
			end

			-- Register the config
			vim.lsp.config[server_name] = config

			-- Enable the server
			vim.lsp.enable(server_name)
		end

		-- Optional C++ compile & run
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "cpp",
			callback = function()
				vim.keymap.set("n", "<leader>r", function()
					local file = vim.fn.expand("%:p")
					local output = vim.fn.expand("%:p:r")
					-- Compile first
					local compile_cmd = "clang++ -std=c++20 -O2 " .. file .. " -o " .. output
					-- Run in terminal split
					vim.cmd("split | terminal " .. compile_cmd .. " && " .. output)
				end, { buffer = true, desc = "Compile and run C++ file" })
			end,
		})
	end,
}
