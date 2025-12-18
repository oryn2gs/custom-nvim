-- wilder 
-- https://github.com/gelguy/wilder.nvim
return {
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    dependencies = { "romgrk/fzy-lua-native" },
    config = function()
      local wilder = require("wilder")

      -- setup wilder
      wilder.setup {
        modes = { ":", "/", "?" },  -- command, forward search, backward search
        enable_cmdline_enter = 0, --  disable wilder by default, you can press next_key toggle wilder
        next_key= "<Tab>",
        previous_key= "<S-Tab>",
        accept_key = "<CR>",
        reject_key = "<Esc>",
      }

      -- -- Renderer: popupmenu with devicons & scrollbar
      -- -- FIX: menu render -- should match our theme h
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer({
          mode = "float",
          highlighter = wilder.lua_fzy_highlighter(),

          highlights = {
            default = "Pmenu",
            selection = "PmenuSel",
            accent = "Keyword",
            border = "FloatBorder",
          },

          left = { " ", wilder.popupmenu_devicons() },
          right = { " ", wilder.popupmenu_scrollbar() },
        })
      )

    end,
  },
}
