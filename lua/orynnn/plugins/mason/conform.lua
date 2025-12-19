-- conform
-- github : https://github.com/stevearc/conform.nvim?tab=readme-ov-file#installation
-- debug: `:ConformInfo`
--
return {
  "stevearc/conform.nvim",
  keys = function()
    local conform = require "conform"
    return {
      {
        "<leader>cf",
        function()
          conform.format { lsp_fallback = true }
        end,
        desc = "Conform format file",
      },
    }
  end,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },

      -- python formatter default to ruff is availabe else fallback to isort, black
      python = function(bufnr)
        local conform = require "conform"
        if conform.get_formatter_info("ruff_format", bufnr).available then
          return { "ruff_format" }
        else
          return { "isort", "black" }
        end
      end,
      -- Use the "*" filetype to run formatters on all filetypes.
      ["*"] = { "codespell" },
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = { "trim_whitespace" },
      rust = { "rustfmt", lsp_format = "fallback" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      lsp_fallback = true, -- fallback to lsp formatter
      async = false, -- will wait for formatting to complete before saving
      timeout_ms = 500,
    },
    stop_after_first = true,
  },
}
