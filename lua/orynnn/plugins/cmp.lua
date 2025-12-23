-- blink
--
return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = false,
    dependencies = {
      { "L3MON4D3/LuaSnip", version = "v2.*" },
      "rafamadriz/friendly-snippets",
      "windwp/nvim-autopairs",
    },
    opts = {
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { -- https://cmp.saghen.dev/configuration/keymap.html
        preset = "default",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "select_and_accept", "fallback" },

        -- show with a list of providers
        ["<C-space>"] = {
          function(cmp)
            cmp.show { providers = { "snippets" } }
          end,
        },
      },
      cmdline = { enabled = false },
      -- COMPLETION (POPUP BEHAVIOR)
      completion = {
        auto_trigger = true,

        documentation = {
          auto_show = true,
        },

        accept = {
          auto_brackets = { enabled = true },
        },

        menu = {
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
          },
        },
      },

      -- SNIPPETS
      snippets = {
        preset = "luasnip", -- optional but explicit
      },

      -- SOURCES
      sources = {
        default = {
          "lsp",
          "buffer",
          "path",
          "snippets",
        },
      },
    },
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },
}
