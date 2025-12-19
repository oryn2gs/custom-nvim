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
  { import = "orynnn.plugins.mason" },
}, {
  defaults = { lazy = true }, -- lazy-load by default
  checker = { enabled = true , notify= true, frequency = 60 * 60 * 24 * 7}, -- auto-check for plugin updates
  install = {
    missing = true,
    colorscheme = {"onedarkpro", "catppuccin", "habamax" },
  },
  ui =  {
    size = {width=0.7, height=0.8},
    border = "rounded",
    backdrop= 0 -- Backdrop opacity (0-100) 0 is fully opaque and 100 is fully transparent.
  }
})

