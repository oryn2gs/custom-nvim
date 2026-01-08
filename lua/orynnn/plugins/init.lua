-- plugins/init.lua
--
--

return {

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
  {
    "mbbill/undotree",
    keys = {
      { "<leader>ut", "<cmd>UndotreeToggle<CR>", desc = "Undo tree toggle" },
    },
    config = function()
      -- plugin options: https://github.com/mbbill/undotree/blob/master/plugin/undotree.vim#L27
      vim.g.undotree_WindowLayout = 4 -- window layout 1 | 2 | 3 | 4
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_TreeNodeShape = "•"
      vim.g.undotree_DiffAutoOpen = 1 -- opens diff window automatically
      vim.g.undotree_SplitWidth = 50
      vim.g.undotree_DiffpanelHeight = 20
    end,
  },
}
