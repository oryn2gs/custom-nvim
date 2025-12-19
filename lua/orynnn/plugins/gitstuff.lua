-- git related plugins
return {
  -- Git
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
    keys = {
      { "<leader>gf", ":Git<CR>", desc = "Git interactive window - vim-fugitive" },
      { "<leader>gs", ":Git status<CR>", desc = "Git status - vim-fugitive" },
      { "<leader>gc", ":Git commit<CR>", desc = "Git commit - vim-fugitive" },
      { "<leader>gp", ":Git push<CR>", desc = "Git push - vim-fugitive" },
      { "<leader>gF", ":Git pull<CR>", desc = "Git pull - vim-fugitive" },
    },
  },
  -- {
  --   "github/copilot.vim",   -- github free tier supports 2000 code completions per month and 50 agent mode : https://docs.github.com/en/copilot/how-tos/set-up/set-up-for-self.
  --   event = "InsertEnter",
  --   keys = {
  --     { "<leader>ge", "<cmd>Copilot enable<CR>", desc = "Github copilot enable" },
  --     { "<leader>gE", "<cmd>Copilot disable<CR>", desc = "Git copilot disable" },
  --     { "<leader>gD", "<cmd>Copilot panel<CR>", desc = "Git copilot dashboard" },
  --   },
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = true,
  --         keymap = {
  --           accept = "<C-l>",
  --           next = "<C-]>",
  --           prev = "<C-[>",
  --           dismiss = "<C-x>",
  --         },
  --       },
  --       panel = { enabled = false },
  --       suggestion = { enabled = true },
  --       server_opts_overrides = {
  --         trace = "off",
  --       }
  --     })
  --
  --     -- if you want to change default <Tab> mapping
  --     -- vim.g.copilot_no_tab_map = true
  --     vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { desc="Github copilot accept suggestion", silent = true, expr = true })
  --   end,
  -- },
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
  },
  -- git worktree, for managing github worktrees in nvim
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("git-worktree").setup({
        -- optional configuration
        update_on_change = true,  -- auto-update telescope after switching
      })
    end,
  },
}
