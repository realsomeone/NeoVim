local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("Bootstrapping lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- load your plugins
require("lazy").setup({{import = "alex.plugins"},{import = "alex.plugins.lsp"}}, {
  git = {
    timeout = 300,  -- seconds (5 minutes)
  },
  change_detection ={
    notify = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
})

