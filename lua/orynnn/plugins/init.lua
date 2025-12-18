-- plugins/init.lua
-- loads plugins that requires minimal setup
--
-- TODO:    wilder, mini module
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
  --  FIX: the undotree render
  {
    "mbbill/undotree",
    config = function()


      vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>", { desc = "Toggle UndoTree" })
    end,
  },

}
