-- todo comments
-- check: https://github.com/folke/todo-comments.nvim
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  keys = function()
    local comment = require "todo-commment"
    return {
      {
        "<leader>tn",
        function()
          comment.junp_next()
        end,
        desc = "Todo comment jump to next.",
      },
      {
        "<leader>tp",
        function()
          comment.jump_prev()
        end,
        desc = "Todo comment jump to next.",
      },
    }
  end,
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
      test = { "Identifier", "#FF00FF" },
    },
  },
}
