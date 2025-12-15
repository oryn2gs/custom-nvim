-- nvim-tree.lua configuration

local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

nvim_tree.setup({
  disable_netrw = true,       -- disable default netrw
  hijack_netrw = true,        -- takeover netrw
  hijack_cursor = true,       -- cursor stays on file
  update_cwd = true,          -- update working directory with focused file
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
  git = {
    enable = true,
    ignore = false,
  },
  filters = {
    dotfiles = false, --info : toogle dotfiles visible
  },

  -- changing default key maps for trash and delete, 
  -- default behabiour deletes files and folder permanently.
  on_attach = function(bufnr)
    local api = require "nvim-tree.api"
    local map = vim.keymap.set
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    -- map("n", "<leader>ub", "<cmd>NvimTreeToggle<CR>", opts "Nvimtree Toggle window")
    map("n", "D", api.fs.remove, opts "Delete")
    map("n", "d", api.fs.trash, opts "Trash")
    map("n", "<C-s>", function() -- open file/folder under the cursor in system default application
      local node = api.tree.get_node_under_cursor()
      if node then
        vim.ui.open(node.absolute_path)
      end
    end, opts "Open file/folder with system application")
  end,
})

