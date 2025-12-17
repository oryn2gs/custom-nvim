-- bufferline 
-- tabs management
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = function()
    return {
      {"<leader>ba", "<cmd>BufferNewHere<CR>", desc = "Bufferline Create new buffer relative to current buffer." },
      {"<leader>bA", "<cmd>BufferNewRoot<CR>", desc = "Bufferline Create new buffer project root dir" },
      {"<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Bufferline Next Buffer" },
      {"<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Bufferline Previous Buffer" },
      {"<leader>bc", "<cmd>BufferLinePick<CR>", desc = "Bufferline pick to open" },
      {"<leader>bx", "<cmd>BufferLinePickClose<CR>", desc = "Bufferline pick to Close" },
      {"<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Bufferline Toggle Pin Buffer" },
      { "<leader>bb", "<cmd>BufferLineCloseLeft<CR>", desc = "Bufferline close buffer right" },
      { "<leader>bn", "<cmd>BufferLineCloseRight<CR>", desc = "Bufferline close buffer right" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Bufferline close other buffers" },
      { "<leader>bd", "<cmd>bdelete<CR>", desc = "Bufferline delete current buffer" },
    
      -- buffer line index shortcut
      {"<leader>1", "<cmd>lua require('bufferline').go_to(1, true)<cr>", desc = "Bufferline go to buffer 1" },
      {"<leader>2", "<cmd>lua require('bufferline').go_to(2, true)<cr>", desc = "Bufferline go to buffer 2" },
      {"<leader>3", "<cmd>lua require('bufferline').go_to(3, true)<cr>", desc = "Bufferline go to buffer 3" },
      {"<leader>4", "<cmd>lua require('bufferline').go_to(4, true)<cr>", desc = "Bufferline go to buffer 4" },
      {"<leader>5", "<cmd>lua require('bufferline').go_to(5, true)<cr>", desc = "Bufferline go to buffer 5" },
      {"<leader>6", "<cmd>lua require('bufferline').go_to(6, true)<cr>", desc = "Bufferline go to buffer 6" },
      {"<leader>7", "<cmd>lua require('bufferline').go_to(7, true)<cr>", desc = "Bufferline go to buffer 7" },
      {"<leader>8", "<cmd>lua require('bufferline').go_to(8, true)<cr>", desc = "Bufferline go to buffer 8" },
      {"<leader>9", "<cmd>lua require('bufferline').go_to(9, true)<cr>", desc = "Bufferline go to buffer 9" },
      {"<leader>$", "<cmd>lua require('bufferline').go_to(-1, true)<cr>", desc = "Bufferline go to last buffer" },

    }
  end,
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "ordinal",          -- show buffer numbers
        close_command = "bdelete! %d",-- close buffer
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        diagnostics = "nvim_lsp",     -- show LSP diagnostics
        separator_style = "thin",
        show_buffer_close_icons = true,
        show_close_icon = false,
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer" ,
                text_align = "left",
                separator = true
            }
        },
        show_buffer_icons = false, -- disable filetype icons for buffers
        -- show_buffer_close_icons =  false,
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      },
      -- style_preset = {bufferline.style_preset.no_italic, bufferline.style_preset.no_bold},
      highlights = {
        -- optional: integrate with your colorscheme
      },
      groups = {
          items = {
            -- pineed buffers are essentially builtin groups, you can pin buffer with :BufferTogglePin command.
            require('bufferline.groups').builtin.pinned:with({ icon = "󰐃 " }),
            highlight = {underline = true, sp = "blue"}, -- Optional


          }
      }
    })
  end,
}
