-- mini module
-- :https://github.com/nvim-mini/mini.nvim?tab=readme-ov-file
--

return {
  {
    "nvim-mini/mini.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.comment").setup {
      -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Toggle comment (like `gcip` - comment inner paragraph) for both, Normal and Visual modes
          comment = 'gc',
          comment_line = 'gcc',  -- Toggle comment on current line
          comment_visual = 'gc',  -- Toggle comment on visual selection
          textobject = 'gc', -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        },
        options = {
          custom_commentstring = function()
            local ok, ts = pcall(require, "ts_context_commentstring.internal")
            if ok then
              return ts.calculate_commentstring({ key = "commentstring" })
            else
              return vim.bo.commentstring
            end
          end,
        }
      }
      -- mini surround
      require("mini.surround").setup {
      -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
        highlight_duration = 1000,
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          add = 'sa', -- Add surrounding in Normal and Visual modes
          delete = 'sd', -- Delete surrounding
          find = 'sf', -- Find surrounding (to the right)
          find_left = 'sF', -- Find surrounding (to the left)
          highlight = 'sh', -- Highlight surrounding
          replace = 'sr', -- Replace surrounding

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },
        n_lines = 20, -- Number of lines within which surrounding is searched
      }
      require("mini.trailspace").setup()
      require("mini.splitjoin").setup {
        mappings = {
          toggle = "",
          split = "<leader>jd",
          join = "<leader>ja"
        }
      }

    end,
  },
}


