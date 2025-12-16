-- your custom commands will go here:
--


local M = {}

function M.setup()
  -- dummy command example
  -- import commands module like this e.g(require("core.commands").setup()

  vim.api.nvim_create_user_command("Hello", function() print("Hello!") end, { desc = "Say hello" })
end

return M
