-- utils/init.lua
-- for utility functions

local M = {}

--[[
  Module: core/utils.lua

  Purpose: 
    Utility function the for trimming white spaces

  Parameters:
    string (string): The input string to be trimmed

--]]
M.trim = function(string)
  return string:match "^%s*(.-)%s*$"
end

return M
