-- plugins/init.lua
-- loads plugins that requires minimal setup
--
-- TODO:    wilder
return {
  -- todo comments
  -- check: https://github.com/folke/todo-comments.nvim
  {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    signs = true, -- show icons in the signs column
    sign_priority = 8, -- sign priority
  
    -- list of named colors where we try to extract the guifg from the
    -- list of highlight groups or use the hex color if hl not found as a fallback
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" }
    },

    }
  },

  -- nvim colorizer -- 
  -- color highlighter for your buffers, e.g(#000 will renders black color) 
  {
    "nvchad/nvim-colorizer.lua",
    config = function()
      local colorizer = require "colorizer"
      colorizer.setup {
        user_default_options = {
          tailwind = true, -- enables highlighting for Tailwind CSS color classes like bg-red-500 or text-green-400.
        },
      }
    end,
  },

  -- undotree
  {
    "mbbill/undotree",
    keys = {
      { "<leader>ut","<cmd>UndotreeToggle<CR>", desc = "Undo tree toggle"}
    },
    config = function()
      -- plugin options: https://github.com/mbbill/undotree/blob/master/plugin/undotree.vim#L27
      vim.g.undotree_WindowLayout = 4   -- window layout 1 | 2 | 3 | 4
      vim.g.undotree_SetFocusWhenToggle = 1   
      vim.g.undotree_TreeNodeShape = "•"  
      vim.g.undotree_DiffAutoOpen = 1  -- opens diff window automatically
      vim.g.undotree_SplitWidth=50
      vim.g.undotree_DiffpanelHeight = 20
    end,
  },

}
