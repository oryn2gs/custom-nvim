-- bufferline
-- tabs management

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = function()
    return {
      { "<leader>ba", "<cmd>BufferNewHere<CR>", desc = "Bufferline Create new buffer relative to current buffer." },
      { "<leader>bA", "<cmd>BufferNewRoot<CR>", desc = "Bufferline Create new buffer project root dir" },
      { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Bufferline Next Buffer" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Bufferline Previous Buffer" },
      { "<leader>bc", "<cmd>BufferLinePick<CR>", desc = "Bufferline pick to open" },
      { "<leader>bx", "<cmd>wa | BufferLinePickClose<CR>", desc = "Bufferline pick to Close" },
      { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Bufferline Toggle Pin Buffer" },
      { "<leader>bl", "<cmd>wa | BufferLineCloseLeft<CR>", desc = "Bufferline close left" },
      { "<leader>bh", "<cmd>wa | BufferLineCloseRight<CR>", desc = "Bufferline close right" },
      { "<leader>bo", "<cmd>wa | BufferLineCloseOthers<CR>", desc = "Bufferline close other buffers" },
      { "<leader>bd", "<cmd>w | bdelete<CR>", desc = "Bufferline delete current buffer" },
      --
      -- buffer line index shortcut
      { "<leader>1", "<cmd>lua require('bufferline').go_to(1, true)<cr>", desc = "Bufferline go to buffer 1" },
      { "<leader>2", "<cmd>lua require('bufferline').go_to(2, true)<cr>", desc = "Bufferline go to buffer 2" },
      { "<leader>3", "<cmd>lua require('bufferline').go_to(3, true)<cr>", desc = "Bufferline go to buffer 3" },
      { "<leader>4", "<cmd>lua require('bufferline').go_to(4, true)<cr>", desc = "Bufferline go to buffer 4" },
      { "<leader>5", "<cmd>lua require('bufferline').go_to(5, true)<cr>", desc = "Bufferline go to buffer 5" },
      { "<leader>6", "<cmd>lua require('bufferline').go_to(6, true)<cr>", desc = "Bufferline go to buffer 6" },
      { "<leader>7", "<cmd>lua require('bufferline').go_to(7, true)<cr>", desc = "Bufferline go to buffer 7" },
      { "<leader>8", "<cmd>lua require('bufferline').go_to(8, true)<cr>", desc = "Bufferline go to buffer 8" },
      { "<leader>9", "<cmd>lua require('bufferline').go_to(9, true)<cr>", desc = "Bufferline go to buffer 9" },
      { "<leader>$", "<cmd>lua require('bufferline').go_to(-1, true)<cr>", desc = "Bufferline go to last buffer" },

      -- tmux
      { "<leader>t1", "<cmd>lua require('orynnn.core.utils.tmux').go_to(1)<CR>", desc = "Tmux session 1" },
      { "<leader>t2", "<cmd>lua require('orynnn.core.utils.tmux').go_to(2)<CR>", desc = "Tmux session 2" },
      { "<leader>t3", "<cmd>lua require('orynnn.core.utils.tmux').go_to(3)<CR>", desc = "Tmux session 3" },
      { "<leader>t4", "<cmd>lua require('orynnn.core.utils.tmux').go_to(4)<CR>", desc = "Tmux session 4" },
      { "<leader>t5", "<cmd>lua require('orynnn.core.utils.tmux').go_to(5)<CR>", desc = "Tmux session 5" },
      { "<leader>t6", "<cmd>lua require('orynnn.core.utils.tmux').go_to(6)<CR>", desc = "Tmux session 6" },
      { "<leader>t7", "<cmd>lua require('orynnn.core.utils.tmux').go_to(7)<CR>", desc = "Tmux session 7" },
      { "<leader>t8", "<cmd>lua require('orynnn.core.utils.tmux').go_to(8)<CR>", desc = "Tmux session 8" },
    }
  end,
  config = function()
    local bufferline = require "bufferline"
    bufferline.setup {
      options = {
        -- INFO:
        -- custom areas that renders all the tmux session by their number
        custom_areas = {
          right = function()
            -- Directly call the function, NOT the command
            ---@type TmuxSession[]
            local sessions = require("orynnn.core.utils.tmux").sessions()
            local segments = {}

            for _, s in ipairs(sessions) do
              -- Logic for colors
              local is_active = s.is_attached

              table.insert(segments, {
                text = " " .. s.id + 1 .. " ", -- tmux session number are index zero based
                fg = is_active and "#ffffff" or "#5b5b5b",
                bg = is_active and "#e06c75" or "#2a2a2a",
                bold = is_active,

                -- CLICK EVENT
                callback = function()
                  -- Execute the tmux switch command
                  -- We use '$' because tmux IDs are prefixed with it (e.g., $1)
                  vim.fn.system("tmux switch-client -t '$" .. s.id .. "'")
                end,
              })

              -- space between segments
              table.insert(segments, { text = " " })
            end

            return segments
          end,
        },
        style_preset = bufferline.style_preset.default,
        themable = true, -- allows to modify highlightgroups
        numbers = "ordinal", -- show buffer numbers
        close_command = "bdelete! %d", -- close buffer
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        diagnostics = "nvim_lsp", -- show LSP diagnostics
        show_buffer_close_icons = false,
        show_close_icon = false,
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        -- -- to configure indicator
        separator_style = { "", "" }, -- remove seperator
        indicator = {
          -- icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "none", -- "icon" | "underline" | "none",
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
        show_buffer_icons = false, -- disable filetype icons for buffers
        -- show_buffer_close_icons =  false,
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
      -- style_preset = {bufferline.style_preset.no_italic, bufferline.style_preset.no_bold},
      highlights = {
        -- optional: integrate with your colorscheme
      },
      groups = {
        items = {
          -- pineed buffers are essentially builtin groups, you can pin buffer with :BufferTogglePin command.
          require("bufferline.groups").builtin.pinned:with { icon = "󰐃 " },
          highlight = { underline = true, sp = "blue" }, -- Optional
        },
      },
    }
  end,
}
