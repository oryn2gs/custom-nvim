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
map("n", "<C-c>", "<cmd>%y+<CR>", opts "Copy whole file")
map("i", "jj", "<ESC>",  opts "Exit insert mode" )
map("n", "<Esc>", "<cmd>noh<CR>", opts "general clear search highlights")

-- Move insert cursor to beginning/end of line without leaving insert mode 
map("n", "<leader>hh", "<ESC>^i", opts "Insert mode: move to beginning of line")
map("n", "<leader>ll", "<ESC>$a", opts "Insert mode: move to end of line")


--- Toggle line numbers
map("n", "<leader>nN", "<cmd>set nu!<CR>", opts "toggle line number")
map("n", "<leader>nn", "<cmd>set rnu!<CR>", opts "toggle relative number")

-- Better  navigation
map("n", "<C-d>", "<C-d>zz", opts "move down in buffer with cursor centered" )
map("n", "<C-u>", "<C-u>zz", opts "move up in buffer with cursor centered" )
map("n", "n", "nzzzv", opts "move to next search result with cursor centered" )
map("n", "N", "Nzzzv", opts "move to previous search result with cursor centered" )

-- Executes shell command from in here making file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts "makes file executable" )

-- window(buffer) management
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


-- In terminal mode, press Esc to enter normal mode
-- PERF: Optinal?? ESC should escape terminal mode while in terminal
-- map("t", '<Esc>', [[<C-\><C-n>]], opts "Terminal exit in term mode")

