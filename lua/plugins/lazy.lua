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
  -- Example plugin
  -- { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  -- { "neovim/nvim-lspconfig" },
  -- { "williamboman/mason.nvim", config = function() require("mason").setup() end },
  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" }, -- lazy-load on these commands
    keys = {
      { "<leader>ub", ":NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
      { "<leader>e", ":NvimTreeFocus<CR>", desc = "Toggle File Explorer" },
    },
    config = function()
      require("plugins.configs.nvim-tree") -- load modular config
    end,
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      preset = "modern"
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- tpope/vim-fugitive
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" }, -- lazy-load when these commands are used
    keys = {
      { "<leader>gg", ":Git<CR>", desc = "Git interactive window" },
      { "<leader>gs", ":Git status<CR>", desc = "Git status" },
      { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
      { "<leader>gp", ":Git push<CR>", desc = "Git push" },
      { "<leader>gl", ":Git pull<CR>", desc = "Git pull" },
    },
  }

}, {
  defaults = { lazy = true }, -- lazy-load by default
  checker = { enabled = true }, -- auto-check for plugin updates
})

