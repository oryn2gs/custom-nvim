-- your custom commands will go here:
-- Buffer relative to current buffer
--
local buffer = require("orynnn.core.utils.new_buffer")

local M = {}

function M.setup()
  -- dummy command example
  -- to add commands module to you project. add this line at init.lua `require("core.commands").setup()`
  vim.api.nvim_create_user_command("Hello", function() print("Hello!") end, { desc = "Say hello" })

  vim.api.nvim_create_user_command("BufferNewHere", function()
    local base_path = vim.fn.expand("%:p:h") or vim.loop.cwd() -- falls back to buffer root
    buffer.add_buffer(base_path)
  end, { desc = "Create new buffer relative to current buffer" })
  --
  -- -- Buffer at project root
  vim.api.nvim_create_user_command("BufferNewRoot", function()
    local base_path = vim.loop.cwd()
    buffer.add_buffer(vim.loop.cwd())
  end, { desc = "Create new buffer at project root" })
end

return M
