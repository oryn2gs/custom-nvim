-- git related plugins
return {
  -- Git
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
    keys = {
      { "<leader>gg", ":Git<CR>", desc = "Git interactive window" },
      { "<leader>gs", ":Git status<CR>", desc = "Git status" },
      { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
      { "<leader>gp", ":Git push<CR>", desc = "Git push" },
      { "<leader>gl", ":Git pull<CR>", desc = "Git pull" },
    },
  },
  {
    "github/copilot.vim",   -- github free tier supports 2000 code completions per month and 50 agent mode : https://docs.github.com/en/copilot/how-tos/set-up/set-up-for-self.
    event = "InsertEnter",
    config = function()
      -- if you want to change default <Tab> mapping
      -- vim.g.copilot_no_tab_map = true
      -- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      --
    end,
  },
  -- git signs : https://github.com/lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",  -- load when a buffer is read
    config = function() 
      require("gitsigns").setup {
        -- See `:help gitsigns.txt`
      }
    end,
  }
}
