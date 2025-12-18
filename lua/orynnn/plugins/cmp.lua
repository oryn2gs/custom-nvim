return {
  -- CMP
  -- blink cmp, check official site for more information on configuratino and customization: https://cmp.saghen.dev/installation
  -- TODO: add integretions with LSP
  {
    "saghen/blink.cmp",
    version = "1.*", -- recommended to use a stable release
    dependencies = {
      "L3MON4D3/LuaSnip",        -- snippet engine
      "rafamadriz/friendly-snippets",
      "windwp/nvim-autopairs",
    },
    opts = {
      keymap = { preset = "default" },
      completion = {
        documentation = { auto_show = false },
        accept = {
          auto_brackets = { enabled = true }, 
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "tailwind_colors" }, 
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",   -- tailwindcss colors autocompletion plugins
    dependencies = {"saghen/blink.cmp"},
    -- optionally, override the default options:
    config = function()
      local tailwind_colorizer = require "tailwindcss-colorizer-cmp"
      tailwind_colorizer.setup {
        color_square_width = 2,
      }
    end,
  },
}
