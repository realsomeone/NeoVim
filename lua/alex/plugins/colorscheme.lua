return {
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	priority = 1000,
	config = function()
		vim.g.moonflyTransparent = true
		vim.g.moonflyItalics = true
		vim.g.moonflyUndercurls = true

		vim.cmd("colorscheme moonfly")
	end,
}
