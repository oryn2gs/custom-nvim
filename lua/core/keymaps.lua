-- keymaps for nvim configurations
-- https://neovim.io/doc/user/map.html


-- Leader key
vim.g.mapleader = " "

local map = vim.keymap.set
-- opts
local function opts(desc)
  return { desc = desc, noremap = true, silent = true }
end


-- Basic mappings
map({ "i", "n", "v" }, "<C-q>", "<cmd>:wa | qall<CR>",  opts "Save all and exit" )
map("n", "<C-a>", "gg<S-v>G", opts "Select all in the buffer" )
map("i", "jj", "<ESC>",  opts "Exit insert mode" )


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

-- Nvim tree mappings
map("n", "<leader>ub", "<cmd>NvimTreeToggle<CR>", opts "Nvimtree Toggle window" )
