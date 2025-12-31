-- autocmds: https://neovim.io/doc/user/autocmd.html
-- here's the list of default events
--

--[[
  Module: autocmds.lua
  Purpose:
    Sets up buffer-local keymaps based on the FileType to quickly add
    a comment at the end of the line.

  Behavior:
    - Triggered automatically on the FileType event.
    - Supports multiple filetypes with predefined comment strings.
    - Maps `gcA` in normal mode to append the appropriate comment.
    - Warns if no comment string is defined for the current filetype.

  Supported Filetypes:
    python, lua, javascript, typescript, rust, yml, yaml, json, toml
--]]

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- comments mapping defines comment string based on file tpe
    local COMMENT_MAPPINGS = {
      python = "#",
      lua = "--",
      javascript = "//",
      typescript = "//",
      rust = "//",
      yml = "#",
      yaml = "#",
      json = "#",
      toml = "#",
    }

    -- Fetch the current filetype
    local filetype = vim.bo.filetype
    local comment_string = COMMENT_MAPPINGS[filetype]

    -- warn and skip if filetype is not defined
    if not comment_string then
      -- vim.notify("No comment string defined for filetype: " .. filetype, vim.log.levels.WARN)
      return
    end

    -- Create the key mapping for the current buffer
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "gcA",
      "$a " .. comment_string .. " <Esc>i",
      { noremap = true, silent = true, desc = "Comment add at end of the line." }
    )
  end,
})
