return {
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	priority = 1000,
	config = function()
		vim.g.moonflyTransparent = true
		vim.g.moonflyItalics = true
		vim.g.moonflyUndercurls = true

		vim.cmd("colorscheme moonfly")

		-- Override specific highlight groups
		vim.api.nvim_set_hl(0, "Normal", { fg = "#c6c6c6" }) -- Main text color
		vim.api.nvim_set_hl(0, "Comment", { fg = "#7c7c7c", italic = true })
		vim.api.nvim_set_hl(0, "String", { fg = "#a1cd5e", bold = true })
		vim.api.nvim_set_hl(0, "Function", { fg = "#74b2ff" })
	end,
}
