-- mason-org/mason 
-- mason a package manager for formatter, linters and lsp servers
--

return {
  -- mason package manager
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  -- bridge between mason and nvim-lspconfig, auto install required packages
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "ts_ls",
        "eslint",
        "emmet_launguage_server",
        "pyright",
        "rust_analyzer"
      },
      automatic_installation = true,

    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },
  -- mason null ls for auto packages installation
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      local mason_null_ls = require "mason-null-ls"
      mason_null_ls.setup {
        ensure_installed = {
          -- lsp --
          "pyright",
          "ruff",

          "typescript-language-server",
          "tailwindcss-language-server",
          "emmet-language-server",
          "eslint-lsp",
          "html-lsp",
          "css-lsp",

          "lua-language-server",
          "luacheck",
          "htmllint",
          "stylelint",
          "clippy",


          -- linters --
          "pylint",
          "eslint",
          "eslint_d",

          -- formatters --
          "stylua",
          "isort",
          "black",

          "prettier",
          "prettierd",
        },
        automatic_installation = true, -- Auto install on startup if missing
      }
    end,
  }
}
