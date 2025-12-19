-- nvim-lint
-- https://github.com/mfussenegger/nvim-lint
--
return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" }, -- lazy load on buffer
    config = function()
      local lint = require "lint"

      -- Define linters per filetype
      lint.linters_by_ft = {
        python = { "ruff", "pylint" }, -- use Ruff and Pylint
        javascript = { "eslint_d" }, -- eslint fast daemon
        typescript = { "eslint_d" },
        lua = { "luacheck" }, -- Lua linter
        html = { "htmllint" },
        css = { "stylelint" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        rust = { "clippy" },
      }

      -- This function tell pylint to use pylint from python environment
      -- we won't need this as we're setting path from our `orynnn/env.lua`
      -- require("lint").linters.pylint.cmd = "python"
      -- require("lint").linters.pylint.args = { "-m", "pylint", "-f", "json" }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      -- Auto lint on save
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>lc", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
}
