
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
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
    },
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

--   -- Telescope 
-- return {
--   {
--     "nvim-telescope/telescope.nvim",
--     tag = 'v0.2.0',
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "nvim-treesitter/nvim-treesitter",
--       {
--         "nvim-telescope/telescope-fzf-native.nvim",
--         build = "make", -- optional: improves sorting performance
--       },
--     },
--     cmd = "Telescope", -- lazy-load when the :Telescope command is used
--     keys = {
--       { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
--       { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
--       { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List buffers" },
--       { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
--     },
--     config = function()
--       local setup = require("telescope").setup
--       local telescope = require("telescope")
--       setup{
--       defaults = {
--         prompt_prefix = "🔍 ",
--         -- selection_caret = " ",
--         path_display = { "smart" },
--         file_ignore_patterns = { "node_modules", ".git/" },
--         selection_caret = " ",
--         entry_prefix = " ",
--         sorting_strategy = "ascending",
--         layout_config = {
--           horizontal = {
--             prompt_position = "top",
--             preview_width = 0.55,
--           },
--           width = 0.87,
--           height = 0.80,
--        },
--         mappings = {
--           i = {
--             ["<C-j>"] = actions.move_selection_next,
--             ["<C-k>"] = actions.move_selection_previous,
--             -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
--           },
--           n = { ["q"] = actions.close },
--         },
--       },
--       -- customize defaults pickers
--       pickers = {
--         find_files = {
--           hidden = false, -- show hidden files
--           no_ignore = false, -- show file ignore by gitignore
--         },
--       },
--
--       extensions_list = { "themes", "terms", "media_files" },
--       extensions = {
--         media_files = {
--           filetypes = { "png", "webp", "jpg", "jpeg", "webm, pdf" },
--           find_cmd = "rg",
--         },
--       },
--       }
--     end,
--     -- Load FZF extension
--     telescope.load_extension("fzf")
--   },
--   {   -- load media files in telescope
--     "nvim-telescope/telescope-media-files.nvim",
--   }
-- }
