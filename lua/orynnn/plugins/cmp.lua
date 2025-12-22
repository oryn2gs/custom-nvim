return {
  -- CMP
  -- blink cmp, check official site for more information on configuratino and customization: https://cmp.saghen.dev/installation
  -- TODO: add integretions with LSP
  {
    "saghen/blink.cmp",
    version = "1.*", -- recommended to use a stable release
    dependencies = {
      "L3MON4D3/LuaSnip", -- snippet engine
      "rafamadriz/friendly-snippets",
      "windwp/nvim-autopairs",
    },
    opts = {
      keymap = { preset = "default" },
      completion = {
        auto_trigger = true, -- show popup automatically while typing
        delay = 100, -- optional, delay in ms before showing
        min_length = 1, -- trigger popup after this many characters
        documentation = { auto_show = false },
        accept = {
          auto_brackets = { enabled = true },
        },
      },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer", "tailwind_colors" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim", -- tailwindcss colors autocompletion plugins
    dependencies = { "saghen/blink.cmp" },
    -- optionally, override the default options:
    config = function()
      local tailwind_colorizer = require "tailwindcss-colorizer-cmp"
      tailwind_colorizer.setup {
        color_square_width = 2,
      }
    end,
  },
}
