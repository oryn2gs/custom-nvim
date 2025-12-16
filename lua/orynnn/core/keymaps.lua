-- keymaps for nvim configurations
-- https://neovim.io/doc/user/map.html


-- Leader key
vim.g.mapleader = " "

local map = vim.keymap.set
-- opts
local function opts(desc)
  return { desc = desc, noremap = true, silent = true }
end

--keymaps

-- Basic mappings
map({ "i", "n", "v" }, "<C-q>", "<cmd>:wa | qall<CR>",  opts "Save all and exit" )
map("n", "<C-a>", "gg<S-v>G", opts "Select all in the buffer" )
map("n", "<C-s>", "<cmd>w<CR>", opts "Save current buffer" )
map("n", "<C-c>", 'gg"+yG', opts("Copy entire buffer"))
map("i", "jj", "<ESC>",  opts "Exit insert mode" )

-- Better indenting and navigation
map("n", "J", "mzJ`z", opts "move line down without moving cursor" )
map("n", "<C-d>", "<C-d>zz", opts "move down in buffer with cursor centered" )
map("n", "<C-u>", "<C-u>zz", opts "move up in buffer with cursor centered" )
map("n", "n", "nzzzv", opts "move to next search result with cursor centered" )
map("n", "N", "Nzzzv", opts "move to previous search result with cursor centered" )

map("v", "<", "<gv", opts  "better indenting in visual mode" )
map("v", ">", ">gv", opts  "better indenting in visual mode" )

-- ctrl c as escape cuz Im lazy to reach up to the esc key
map("i", "<C-c>", "<Esc>", opts  "Exit insert mode" )
map("n", "<C-c>", ":nohl<CR>", opts "Clear search hl")
map("n", "<leader>fk", vim.lsp.buf.format)

-- Executes shell command from in here making file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })


-- NVIM window management
map("n", "<leader>ws", ":split<Return>",  opts  "Window split horizontally" )
map("n", "<leader>wv", ":vsplit<Return>",  opts  "Window split vertically" )
map("n", "<leader>we", "<C-w>",  opts  "Window resize equally" )
map("n", "<leader>wm", "<C-w>|",  opts  "Window resize active window to max-width" )
map("n", "<leader>wo", "<C-w>o",  opts  "Window quit all other windows" )
map("n", "<leader>wq", "<C-w>q",  opts  "Window quit active window" )
map("n", "<leader>ww", "<C-w>w",  opts  "Window switch" )
map("n", "<leader>w>", "<C-w>>",  opts  "Window width increase" )
map("n", "<leader>w<", "<C-w><",  opts  "Window width decrease" )
map("n", "<leader>w+", "<C-w>+",  opts  "Window height increase" )
map("n", "<leader>w-", "<C-w>-",  opts  "Window height decrease" )
map("n", "<leader>wh", "<C-w>h",  opts  "Window navigate left" )
map("n", "<leader>wj", "<C-w>j",  opts  "Window navigate bottom" )
map("n", "<leader>wk", "<C-w>k",  opts  "Window navigate top" )
map("n", "<leader>wl", "<C-w>l",  opts  "Window navigate right" )


-- Todo Comments
map("n", "<leader>tn", function()
  require("todo-comments").jump_next()
end, { desc = "Todo comments jump next" })
map("n", "<leader>tp", function()
  require("todo-comments").jump_prev()
end, { desc = "Todo comments jump prev" })



-- Terminal mappings
-- TODO: presistent state for terminal or checkout  "akinsho/toggleterm.nvim"
-- map("n", "<leader>tt", function()
--   vim.cmd("vsplit | terminal")
-- end, opts  "Terminal Vertical" )
-- map("n", "<leader>th", function()
--   vim.cmd("split | terminal")
-- end, { desc = "Terminal Horizontal" })
-- map("t", "<Esc>", [[<C-\><C-n>]], opts  "Terminal exit to terminal mode" )

-- -- Keep track of the last terminal buffer
-- local last_term_buf = nil
--
-- -- Function to open terminal in horizontal or vertical split
-- local function toggle_terminal(direction)
--   if last_term_buf and vim.api.nvim_buf_is_valid(last_term_buf) then
--     -- Terminal exists: open in requested split
--     if direction == "horizontal" then
--       vim.cmd("split | buffer " .. last_term_buf)
--     elseif direction == "vertical" then
--       vim.cmd("vsplit | buffer " .. last_term_buf)
--     end
--     vim.cmd("startinsert")
--     return
--   end
--
--   -- Terminal doesn't exist: create new one
--   if direction == "horizontal" then
--     vim.cmd("split | terminal")
--   elseif direction == "vertical" then
--     vim.cmd("vsplit | terminal")
--   end
--
--   last_term_buf = vim.api.nvim_get_current_buf()
--   vim.cmd("startinsert")
-- end
--
-- -- Keymaps for toggling terminal
-- vim.keymap.set("n", "<leader>th", function() toggle_terminal("horizontal") end, { desc = "Toggle Horizontal Terminal" })
-- vim.keymap.set("n", "<leader>tt", function() toggle_terminal("vertical") end, { desc = "Toggle Vertical Terminal" })
--
-- -- Exit terminal mode without closing session
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode", noremap = true, silent = true })
