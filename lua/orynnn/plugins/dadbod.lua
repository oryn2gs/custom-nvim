-- dadbod:
-- for database management in Neovim

return {
  {"tpope/vim-dadbod"},
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    config = function()
      vim.g.dadbod_ui_auto_execute_table_helpers = 1
      vim.g.dadbod_ui_win_position = "right"
    end,
    event = "VeryLazy",
  },

}
