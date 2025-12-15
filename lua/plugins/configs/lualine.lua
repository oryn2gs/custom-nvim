local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "auto",
    icons_enabled = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    globalstatus = true, -- Neovim 0.9+ single statusline
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_c = { "filename" },
    lualine_x = { "location" },
  },
})
