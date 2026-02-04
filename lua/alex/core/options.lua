local opt = vim.opt

-- Tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.number = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Swapfile
opt.swapfile = false

-- Earthy transparent theme
local function set_earthy_transparency()
	vim.cmd([[
    highlight Normal guibg=none guifg=#D5C4A1
    highlight NormalNC guibg=none guifg=#D5C4A1
    highlight SignColumn guibg=none
    highlight VertSplit guibg=none guifg=#7C6F64
    highlight StatusLine guibg=none guifg=#EBDBB2
    highlight StatusLineNC guibg=none guifg=#A89984
    highlight TabLine guibg=none guifg=#EBDBB2
    highlight TabLineSel guibg=none guifg=#FABD2F
    highlight EndOfBuffer guibg=none guifg=#928374
    highlight MsgArea guibg=none guifg=#D5C4A1
    highlight Pmenu guibg=none guifg=#D5C4A1
    highlight PmenuSel guibg=none guifg=#83A598
    highlight PmenuSbar guibg=none guifg=#504945
    highlight PmenuThumb guibg=none guifg=#7C6F64
    highlight Comment guifg=#928374
    highlight Constant guifg=#B16286
    highlight Identifier guifg=#98971A
    highlight Statement guifg=#FB4934
    highlight Type guifg=#FABD2F
    highlight Function guifg=#83A598
    highlight Keyword guifg=#FE8019
    highlight String guifg=#B8BB26
  ]])
end

set_earthy_transparency()
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = set_earthy_transparency,
})

-- Toggle transparency
local transparent_enabled = true

function ToggleTransparency()
	transparent_enabled = not transparent_enabled
	if transparent_enabled then
		set_earthy_transparency()
		print("Transparency: ON")
	else
		vim.cmd([[
      highlight clear Normal
      highlight clear NormalNC
      highlight clear SignColumn
      highlight clear StatusLine
      highlight clear StatusLineNC
      highlight clear TabLine
      highlight clear TabLineSel
    ]])
		print("Transparency: OFF")
	end
end

vim.keymap.set("n", "<leader>tt", ToggleTransparency, { desc = "Toggle transparency" })
