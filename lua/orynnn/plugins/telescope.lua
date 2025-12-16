
-- Telescope
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-media-files.nvim",
    },
    cmd = "Telescope",
    keys = function()
      local builtin = require("telescope.builtin")
      return {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Telescope Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope List buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope Help tags" },
        { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Telescope find todos" },
        { "<leader>fp", "<cmd>Telescope media_files<CR>", desc = "Telescope find media files" },
        { "<leader>fa", function() require('telescope.builtin').find_files({hidden=true}) end, desc = "Telescope find hidden files" },
        { "<leader>fr", builtin.old_files, desc = "Telescope find media files" },
        { "<leader>fR", builtin.resume, desc = "Telescope resume previous state" },
        { "<leader>fT", builtin.commands, desc = "Telescope list available plugins/user commands" },
        { "<leader>fq", builtin.quickfix, desc = "Telescope list quickfix item" },
        { "<leader>fv", builtin.vim_options, desc = "Telescope list vim options" },
        { "<leader>fM", builtin.man_pages, desc = "Telescope list manpages" },
        { "<leader>fz", builtin.colorscheme, desc = "Telescope list colorscheme" },
        { "<leader>fm", builtin.marks, desc = "Telescope list marks" },
        { "<leader>fH", builtin.highlights, desc = "Telescope list highlights" },
        { "<leader>fj", builtin.jumplist, desc = "Telescope list jumplist" },
        { "<leader>fA", builtin.autocommands, desc = "Telescope list vim autocmds" },
        
        -- Git related mappings
        { "<leader>gc", builtin.git_commits, desc = "Git commits - Telescope" },
        { "<leader>gC", builtin.git_bcommits, desc = "Git current buffer commit history - Telescope" },
        { "<leader>gb", builtin.git_brances, desc = "Git branch list - Telescope" },
        { "<leader>gs", builtin.git_status, desc = "Git status - Telescope" },
        { "<leader>gS", builtin.git_stash, desc = "Git stash list - Telescope" },
        
        -- TODO: configure lsp key mappings
      }
    end,
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          entry_prefix = " ",
          path_display = { "smart" },
          file_ignore_patterns = { "node_modules", ".git/" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = function(prompt_bufnr)
                actions.send_to_qflist(prompt_bufnr)
                actions.open_qflist(prompt_bufnr)
              end,
            },
            n = { ["q"] = actions.close },
          },
        },
        pickers = {
          find_files = {
            hidden = false,
            no_ignore = false,
          },
        },
        extensions_list = { "fzf", "media_files" },
        extensions = {
          media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg", "webm", "pdf" },
            find_cmd = "rg",
          },
        },
      })

      -- Load extensions after setup
      telescope.load_extension("fzf")
      telescope.load_extension("media_files")
    end,
  },
}

