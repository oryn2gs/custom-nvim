-- keymaps for nvim configurations
-- https://neovim.io/doc/user/map.html


-- Leader key
vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic mappings
map({ "i", "n", "v" }, "<C-q>", "<cmd>:wa | qall<CR>", { desc = "Save all and exit" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all in the buffer" })
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })


-- NVIM window management
map("n", "<leader>ws", ":split<Return>", { desc = "Window split horizontally" })
map("n", "<leader>wv", ":vsplit<Return>", { desc = "Window split vertically" })
map("n", "<leader>we", "<C-w>=", { desc = "Window resize equally" })
map("n", "<leader>wm", "<C-w>|", { desc = "Window resize active window to max-width" })
map("n", "<leader>wo", "<C-w>o", { desc = "Window quit all other windows" })
map("n", "<leader>wq", "<C-w>q", { desc = "Window quit active window" })
map("n", "<leader>ww", "<C-w>w", { desc = "Window switch" })
map("n", "<leader>w>", "<C-w>>", { desc = "Window width increase" })
map("n", "<leader>w<", "<C-w><", { desc = "Window width decrease" })
map("n", "<leader>w+", "<C-w>+", { desc = "Window height increase" })
map("n", "<leader>w-", "<C-w>-", { desc = "Window height decrease" })
