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

-- Nvim tree mappings
map("n", "<leader>ub", "<cmd>NvimTreeToggle<CR>", opts "Nvimtree Toggle window" )

-- Telecope mappings
map("n", "<leader>fm", "<cmd>Telescope media_files<CR>", { desc = "Telescope find media files" })
map("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Telescope find todos" })
-- map("n", "<leader>fr", require("telescope.builtin").oldfiles, { desc = "Telescope find recent files" })

-- Noice Mappings
map("n", "<leader>nm", "<cmd>Noice telescope<CR>", { desc = "Noice messages in telescope." })
map("n", "<leader>ne", "<cmd>Noice errors<CR>", { desc = "Noice errors message." })

-- Todo Comments
map("n", "<leader>tn", function()
  require("todo-comments").jump_next()
end, { desc = "Todo comments jump next" })
map("n", "<leader>tp", function()
  require("todo-comments").jump_prev()
end, { desc = "Todo comments jump prev" })


-- bufferline mappings
-- TODO: check bufferline to create keymaps
-- function to delete buffers except the active one
function delete_other_buffers()
  local current_buffer = vim.api.nvim_get_current_buf()
  local all_buffers = vim.api.nvim_list_bufs()
  for _, buffer in ipairs(all_buffers) do
    if buffer ~= current_buffer then
      vim.api.nvim_buf_delete(buffer, { force = true })
    end
  end
end
map("n", "<leader>bo", ":lua delete_other_buffers()<CR>",  opts  "Buffer close all other" )
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })
-- map("n", "<leader>bL", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
-- map("n", "<leader>bR", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
