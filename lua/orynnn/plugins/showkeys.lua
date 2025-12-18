-- showkeys.nvim: https://github.com/nvzone/showkeys/blob/main/README.md
-- 

return {
  "nvzone/showkeys",
  lazy = true, -- auto run on startup
  cmd = "ShowkeysToggle",
  keys = {
    {"<leader>sk", "<cmd>ShowkeysToggle<CR>", desc = "Show keys toggle."}
  },
  opts = {
      position = "bottom-right",
      maxkeys = 3,
      show_count = true,
      winopts = { -- :h nvim_open_win
          focusable = false,
          relative = "editor",
          style = "minimal",
          border = "single",
          height = 1,
      },
      excluded_modes = {"i"},
  },
}
