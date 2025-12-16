-- Core Neovim options
-- Reference: https://neovim.io/doc/user/options.html
--
vim.g.mapleader=" "

-- Appearance
vim.o.number = true             -- show line numbers
vim.o.relativenumber = true     -- show relative line numbers
vim.o.cursorline = true         -- highlight current line
vim.o.cursorlineopt = "both"          -- enable cursorline for both screen line and line number
vim.o.termguicolors = true      -- enable 24-bit colors
vim.o.signcolumn = "yes"        -- always show sign column (for git/gitsigns)

-- Editing
vim.o.expandtab = true          -- use spaces instead of tabs
vim.o.shiftwidth = 2            -- number of spaces for each indentation
vim.o.tabstop = 2               -- number of spaces a tab counts for
vim.o.smartindent = true        -- auto-indent new lines
vim.o.autoindent = true         -- copy indent from current line
vim.o.breakindent = true               -- visually indent wrapped lines to match the start of the line
vim.o.backspace = "indent,eol,start"  -- allow backspace over autoindent, line breaks, and start of insert
vim.o.wrap = false              -- disable line wrapping

-- Searching
vim.o.ignorecase = true         -- case-insensitive search
vim.o.smartcase = true          -- but sensitive if uppercase used
vim.o.hlsearch = true           -- highlight search results
vim.o.incsearch = true          -- incremental search

-- Files
vim.o.swapfile = false         
vim.o.backup = false            -- disable backup
vim.o.undofile = true           -- enable persistent undo
vim.o.undodir = vim.fn.stdpath("data") .. "/undo" -- undo file location

-- Clipboard
vim.o.clipboard = "unnamedplus" -- use system clipboard

-- Splits
vim.o.splitright = true         -- vertical splits open to the right
vim.o.splitbelow = true         -- horizontal splits open below

-- Other useful settings
-- vim.o.scrolloff = 8             -- keep 8 lines visible above/below cursor
-- vim.o.sidescrolloff = 8
vim.o.lazyredraw = true         -- faster macros and regex
vim.o.updatetime = 300          -- faster CursorHold events

-- Folding
-- vim.o.foldmethod = "manual"           -- use manual folding (you control folds)
-- vim.o.foldopen = "all"                 -- when opening a fold, open all contained folds
-- vim.o.foldclose = "all"                -- when closing a fold, close all contained folds

-- Disable some built-in plugins if desired
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
