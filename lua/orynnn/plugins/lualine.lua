-- lualine
-- bottom statusline: 
return {
"nvim-lualine/lualine.nvim",
  event = "VeryLazy", -- lazy-load after startup
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons
  config = function()
    require("lualine").setup {
      options = {
        theme = "auto",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        globalstatus = true, 
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = { "branch", "diff", "diagnostics"},
        lualine_x = {},
        lualine_y = {"lsp_status"},
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat"},
      },
    }
  end,
}
