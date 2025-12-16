-- nvim treesitter
-- FIX: https://github.com/nvim-treesitter/nvim-treesitter/issues/914
-- --- tries to configure nvim-treesitter before the package is fully loaded.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- ensures parsers are installed/updated
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
          "html",
          "css",

          "javascript",
          "typescript",
          "tsx",

          "prisma",

          "python",
          "scss",
          "htmldjango",

          "rust",

          "lua",
          "luadoc",

          "vim",
          "vimdoc",

          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",

          "dockerfile",

          "markdown",
          "markdown_inline",
          "yaml",
          "csv",

          "caddy",
          "nginx",
          "terraform",

          "arduino",
          "bash",
          "promql",
          "sql",
          "xml",
          "regex",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        -- List of parsers to ignore installing (or "all")
        -- ignore_install = { "javascript" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        { import = "plugins" },

        indent = {
        enable = true,               -- smarter indentation
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          node_decremental = "grm",
          scope_incremental = "grc",
        },
      },

      -- TODO: learn more about text objects
      textobjects = {
        select = {
          enable = true,
          lookahead = true,  -- automatically jump forward to textobject
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    }
  end,
},

