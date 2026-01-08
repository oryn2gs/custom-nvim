---@diagnostic disable: undefined-global
---@meta

---@class TmuxSession
---@field id string
---@field name string
---@field is_attached boolean

local M = {}

---Parses raw tmux output into a structured table
---@param raw_text string The raw output from `tmux ls`
---@return TmuxSession[]
local function parse_tmux_sessions(raw_text)
  local items = {}

  -- Loop through each line of the input
  for line in raw_text:gmatch "[^\r\n]+" do
    -- Pattern explanation:
    -- %$        -> Matches the literal "$"
    -- (%d+)     -> Captures the number (ID)
    -- %s+       -> Matches whitespace
    -- ([%w%-%._]+) -> Captures the name (letters, numbers, dashes, dots, underscores)
    -- %s+       -> Matches whitespace
    -- (%d)      -> Captures the attached bit (1 or 0)
    local id, name, attached = line:match "%$(%d+)%s+([%w%-%._]+)%s+(%d)"

    if id and name and attached then
      table.insert(items, {
        id = id, -- tmux uses zero based index
        name = name,
        is_attached = (attached == "1"),
      })
    end
  end

  -- sort the table based id 1,2,3,4,
  -- Sort the table based on ID numerically
  table.sort(items, function(a, b)
    return tonumber(a.id) < tonumber(b.id)
  end)

  return items
end

---Fetches tmux sessions and handles errors
---@return TmuxSession[]
M.sessions = function()
  local output = vim.fn.system 'tmux ls -F "#{session_id} #S #{session_attached}"'
  local sessions = parse_tmux_sessions(output)

  return sessions
end

---@param session_number number
M.go_to = function(session_number)
  -- takes a argument session number and navigates to session
  --
  vim.fn.system("tmux switch-client -t '$" .. session_number - 1 .. "'")
  -- Force Neovim to redraw the tabline/bufferline
  -- so the 'is_attached' color moves to the new session
  -- vim.schedule(function()
  --   vim.cmd "redrawtabline"
  -- end)
end

return M
