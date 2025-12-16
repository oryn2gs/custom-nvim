-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
  -- import plugins modules
  { import = "orynnn.plugins" },
  { import = "orynnn.plugins.lsp" },
}, {
  defaults = { lazy = true }, -- lazy-load by default
  checker = { enabled = true }, -- auto-check for plugin updates
})

