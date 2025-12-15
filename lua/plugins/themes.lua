# themes installation


--[[
  Module: plugins/themes.lua
  Purpose:
    Defines all available colorscheme plugins and exposes the theme
    list for use by the theme manager.
--]]

local M = {}

M.themes = {
  "tokyonight",
  "catppuccin",
  "gruvbox",
  "poimandres"
}

M.plugins = {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },
{
  'olivercederborg/poimandres.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('poimandres').setup {
      -- leave this setup function empty for default config
      -- or refer to the configuration section
      -- for configuration options
      disable_background = true, -- disable background
    }
  end,

  -- optionally set the colorscheme within lazy config
  init = function()
    vim.cmd("colorscheme poimandres")
  end
}
}

return M
