-- telescope configuration
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    prompt_prefix = "🔍 ",
    -- selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { "node_modules", ".git/" },
    selection_caret = " ",
    entry_prefix = " ",
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
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      },
      n = { ["q"] = actions.close },
    },
  },
  -- customize defaults pickers
  pickers = {
    find_files = {
      hidden = false, -- show hidden files
      no_ignore = false, -- show file ignore by gitignore
    },
  },

  extensions_list = { "themes", "terms", "media_files" },
  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg", "webm, pdf" },
      find_cmd = "rg",
    },
  },


})

-- Load FZF extension
telescope.load_extension("fzf")

