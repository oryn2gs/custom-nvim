-- nvim tree: https://github.com/nvim-tree/nvim-tree.lua


-- FIX: folder icons
-- create a file should open new file and focus
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { 
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true }) -- initialize icons
    end,
  },
  cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeCollapse" }, -- lazy-load on these commands
  keys = {
    { "<leader>ub", ":NvimTreeToggle<CR>", desc = "Nvim Tree Toggle File Explorer" },
    { "<leader>e", ":NvimTreeFocus<CR>", desc = "Nvim Tree Focus File Explorer" },
    { "<C-w>", ":NvimTreeCollapse<CR>", desc = "Nvim Tree Collapse" },
  },
  config = function()
    require("nvim-tree").setup({ disable_netrw = true,       -- disable default netrw hijack_netrw = true,        -- takeover netrw
      respect_buf_cwd = true,
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 35,
        side = "left",
        mappings = {
          list = {
            { key = "h", action = "close_node" },
            { key = "l", action = "edit" },
          },
        },
      },
      update_focused_file = {
        enable = true,      -- keep the current file focused
      },
      live_filter = {
        prefix = "[FILTER]: ",
        -- prefix = "🔍 ",
        always_show_folders = true,
      },
      git = {
        enable = true,
        ignore = false,
      },
      filters = {
        dotfiles = false, -- toggle dotfiles visible
      },

      -- changing default key maps for trash and delete
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"
        local map = vim.keymap.set
        -- opts
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        map("n", "D", api.fs.remove, opts "Delete")
        map("n", "d", api.fs.trash, opts "Trash")
        map("n", "<C-s>", function() -- open file/folder under the cursor in system default application
          local node = api.tree.get_node_under_cursor()
          if node then
            vim.ui.open(node.absolute_path)
          end
        end, opts "Open file/folder with system application")
      end, -- close on_attach
    }) -- close setup
  end,
}
