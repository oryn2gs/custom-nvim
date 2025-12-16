-- plugins/init.lua
-- loads plugins that requires minimal setup
--
-- TODO: snacks, haroon, undotree , wilder, showkey, gitworktree, ghost-text, render-markdown, autotags
-- mini module
return {
  -- whichkey
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

  -- todo comments
  {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
  },


  -- vim surround 
  {"tpope/vim-surround"},
  -- {
  --   "kylechui/nvim-surround",
  --   version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   config = function()
  --       require("nvim-surround").setup({
  --           -- Configuration here, or leave empty to use defaults
  --       })
  --   end
  -- },
  
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


  -- theme 
  {
    "olimorris/onedarkpro.nvim",
    lazy=false,
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup {
        -- Main options --
        dark_theme = "onedark_dark", -- The default dark theme.
        light_theme = "onedark_light", -- The default light theme.
        styles = { -- You can set any of the style options below to "NONE" to disable it
          types = "italic", -- Style for types
          numbers = "NONE", -- Style for numbers
          comments = "italic", -- Style for comments
          strings = "NONE", -- Style for strings
          keywords = "bold", -- Style for keywords
          functions = "NONE", -- Style for functions
          variables = "NONE", -- Style for variables
        },
        options = {
          transparency = true, -- Disable setting background
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
        },
      }
      vim.cmd("colorscheme onedark")
    end,
  }


}
