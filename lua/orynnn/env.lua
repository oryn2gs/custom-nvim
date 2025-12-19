-- lua/orynnn/env.lua
local M = {}

-- Check if directory exists
local function dir_exists(path)
  return vim.fn.isdirectory(path) == 1
end

-- Prepend paths if they exist
function M.prepend_paths(paths)
  for _, p in ipairs(paths) do
    if dir_exists(p) and not vim.env.PATH:find(p, 1, true) then
      vim.env.PATH = p .. ":" .. vim.env.PATH
    end
  end
end

-- Detect Python interpreter
function M.get_python_interpreter()
  -- Project virtualenv
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then
    return venv .. "/bin/python"
  end

  -- Fallback to .venv in project root
  local project_venv = vim.fn.getcwd() .. "/.venv/bin/python"
  if vim.fn.filereadable(project_venv) == 1 then
    return project_venv
  end

  -- System python
  local handle = io.popen("which python3")
  local python = handle:read("*a"):gsub("%s+", "")
  handle:close()
  if python ~= "" then
    return python
  end

  -- Last resort
  return "/usr/bin/python3"
end

function M.setup()
  -- local paths = {
  --   vim.fn.getcwd() .. "/node_modules/.bin",  -- Node
  --   os.getenv("VIRTUAL_ENV") and os.getenv("VIRTUAL_ENV") .. "/bin" or nil,  -- Python venv
  --   vim.fn.expand("~/.cargo/bin"),            -- Rust
  --   vim.fn.stdpath("data") .. "/mason/bin",   -- Mason
  -- }
  --
  -- -- Remove nils
  -- local filtered_paths = {}
  -- for _, p in ipairs(paths) do if p then table.insert(filtered_paths, p) end end
  -- M.prepend_paths(filtered_paths)

  -- Set python host
  vim.g.python3_host_prog = M.get_python_interpreter()
end

return M
