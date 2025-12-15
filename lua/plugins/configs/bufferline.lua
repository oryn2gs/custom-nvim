local status, bufferline = pcall(require, "bufferline")

-- setup bufferline
bufferline.setup({
  options = {
    numbers = "ordinal",          -- show buffer numbers
    close_command = "bdelete! %d",-- close buffer
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    diagnostics = "nvim_lsp",     -- show LSP diagnostics
    separator_style = "slant",
    show_buffer_close_icons = true,
    show_close_icon = false,
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
  highlights = {
    -- optional: integrate with your colorscheme
  },
})
