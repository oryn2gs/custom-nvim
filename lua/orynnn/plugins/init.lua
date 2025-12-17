-- plugins/init.lua
-- loads plugins that requires minimal setup
--
-- TODO:    wilder, mini module
return {
  -- todo comments
  {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
  },


  -- nvim colorizer -- 
  -- color highlighter for your buffers, e.g(#000 will renders black color) 
  {
    "nvchad/nvim-colorizer.lua",
    config = function()
      local colorizer = require "colorizer"
      colorizer.setup {
        user_default_options = {
          tailwind = true, -- enables highlighting for Tailwind CSS color classes like bg-red-500 or text-green-400.
        },
      }
    end,
  },


  -- undotree
  --  FIX: the undotree render
  {
    "mbbill/undotree",
    config = function()

      -- FIX: the verticle split
      vim.g.undotree_WindowLayout = 2             -- vertical split
      vim.g.undotree_SplitWidth = math.floor(vim.o.columns * 0.5)  -- 50% width
      vim.g.undotree_SetFocusWhenToggle = 1       -- focus automatically
      vim.g.undotree_TreeNodeShape = "•"
      vim.g.undotree_DiffAutoOpen = 1             -- open diff automatically

      vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle UndoTree" })
    end,
  },

}
