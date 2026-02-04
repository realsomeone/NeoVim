-- Leader key and keymap setup
vim.g.mapleader = " "
local keymap = vim.keymap

-- General keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Remove conflicting mappings
pcall(vim.api.nvim_del_keymap, "n", "<C-h>")
pcall(vim.api.nvim_del_keymap, "n", "<C-j>")
pcall(vim.api.nvim_del_keymap, "n", "<C-k>")
pcall(vim.api.nvim_del_keymap, "n", "<C-l>")

-- Window navigation with tmux support
local function try_win_or_tmux(dir)
	local cur = vim.api.nvim_get_current_win()
	vim.cmd("wincmd " .. dir)
	if vim.api.nvim_get_current_win() == cur then
		if vim.env.TMUX then
			local cmd = "tmux select-pane -" .. ({ h = "L", j = "D", k = "U", l = "R" })[dir]
			os.execute(cmd)
		end
	end
end

keymap.set("n", "<C-h>", function() try_win_or_tmux("h") end, { noremap = true, silent = true })
keymap.set("n", "<C-j>", function() try_win_or_tmux("j") end, { noremap = true, silent = true })
keymap.set("n", "<C-k>", function() try_win_or_tmux("k") end, { noremap = true, silent = true })
keymap.set("n", "<C-l>", function() try_win_or_tmux("l") end, { noremap = true, silent = true })
