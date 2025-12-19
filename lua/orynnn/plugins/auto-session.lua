return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>sc", "<cmd>AutoSession restore<CR>", desc = "Auto session restore." }, -- restore last workspace session for current directory
    { "<leader>ss", "<cmd>AutoSession save<CR>", desc = "Auto Session Save" }, -- save workspace session for current working directory
  },
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = {"~/"}, -- if you want to supres directory
    allowed_dirs = { "~/workspace"},
    purge_after_minutes = 24 * 24 * 60 * 7, -- on week
    restore_error_handler = nil, -- restore error handler
    -- log_level = 'debug',
    ---
  },

}
