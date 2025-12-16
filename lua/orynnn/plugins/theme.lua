-- theme 
-- 
return {
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
