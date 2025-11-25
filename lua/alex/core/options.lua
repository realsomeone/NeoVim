local opt = vim.opt -- for conciseness

-- =====================================
-- TABS & INDENTATION
-- =====================================
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- =====================================
-- LINE WRAPPING
-- =====================================
opt.wrap = false -- disable line wrapping

-- =====================================
-- SEARCH SETTINGS
-- =====================================
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if mixed case in search, assume case-sensitive

-- =====================================
-- CURSOR LINE
-- =====================================
opt.cursorline = true -- highlight the current cursor line

-- =====================================
-- APPEARANCE
-- =====================================
opt.number = true -- show absolute line numbers
opt.termguicolors = true -- enable 24-bit colors
opt.background = "dark" -- use dark theme
opt.signcolumn = "yes" -- show sign column so text doesn't shift

-- =====================================
-- BACKSPACE
-- =====================================
opt.backspace = "indent,eol,start" -- allow backspace in insert mode

-- =====================================
-- CLIPBOARD
-- =====================================
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- =====================================
-- SPLIT WINDOWS
-- =====================================
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- =====================================
-- SWAPFILE
-- =====================================
opt.swapfile = false -- disable swapfile

-- =====================================
-- EARTHY TRANSPARENT THEME
-- =====================================
local function set_earthy_transparency()
	vim.cmd([[
    " Transparent background
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

    " Syntax highlighting with earthy colors
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

-- apply on startup
set_earthy_transparency()

-- reapply on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = set_earthy_transparency,
})

-- =====================================
-- TOGGLE TRANSPARENCY
-- =====================================
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
