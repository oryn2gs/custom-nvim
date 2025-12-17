-- utils/buffer.lua 
-- for utility functions
local utils = require("orynnn.core.utils")
local M = {}

-- Safe buffer/file creation
M.create_file = function(fullpath)
  local ok, err = pcall(function()
    vim.cmd("enew")            -- open new empty buffer
    vim.cmd("file " .. fullpath) -- set buffer filename
    vim.cmd("write")           -- save file
  end)

  if not ok then
    vim.notify("Failed to create file: " .. err, vim.log.levels.ERROR)
  else
    vim.notify("File created: " .. fullpath, vim.log.levels.INFO)
  end
end

-- Main function: prompt user and create buffer
M.add_buffer = function(base_path)
  local filename = vim.fn.input("Enter new file name: ")
  filename = utils.trim(filename)
  if filename == "" then
    vim.notify("Cancelled: no filename provided", vim.log.levels.WARN)
    return
  end

  local fullpath = base_path .. "/" .. filename
  M.create_file(fullpath)
end

return M
