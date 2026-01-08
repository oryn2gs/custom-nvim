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
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_x = {
          { "datetime", style = "%I:%M %p" },
        },
        lualine_y = {
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          "lsp_status",
        },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat" },
      },
    }
  end,
}
