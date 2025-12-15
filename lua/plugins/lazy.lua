-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
  -- nvim tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" }, -- lazy-load on these commands
    keys = {
      { "<leader>ub", ":NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
      { "<leader>e", ":NvimTreeFocus<CR>", desc = "Toggle File Explorer" },
    },
    config = function()
      require("plugins.configs.nvim-tree") -- load modular config
    end,
  },

  -- whichkey
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      preset = "modern"
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },


  -- Telescope 
  -- && media files to load media files in telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = 'v0.2.0',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make", -- optional: improves sorting performance
      },
    },
    cmd = "Telescope", -- lazy-load when the :Telescope command is used
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  },

  {
    "nvim-telescope/telescope-media-files.nvim",
  },

  -- todo comments
  {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
  },

  

  -- noice
  -- nvim noice for notification
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "munifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      background_color = "#000000",
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },

          -- lsp signature help
          signature = {
            enabled = true,
            auto_open = {
              enabled = false,
              trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
              luasnip = false, -- Will open signature help when jumping to Luasnip insert nodes
              throttle = 50, -- Debounce lsp signature help request by 50ms
            },
            view = nil, -- when nil, use defaults from documentation
            opts = {}, -- merged with defaults from documentation
          },
          -- documentation
          documentation = {
            view = "hover",
            ---@type NoiceViewOptions
            opts = {
              lang = "markdown",
              replace = true,
              render = "plain",
              format = { "{message}" },
              win_options = { concealcursor = "n", conceallevel = 3 },
            },
          },
        },

        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },

        --show recording with noice
        -- INFO: uncomment to show recording with noice -- using NvChad UI statusline to show recording
        --
        -- routes = {
        --   {
        --     view = "notify",
        --     filter = { event = "msg_showmode" },
        --   },
        -- },
          
        },
    -- FIX: need to fix the auto entering lsp "hover" view -
    -- link -> https://github.com/folke/noice.nvim/blob/0427460c2d7f673ad60eb02b35f5e9926cf67c59/lua/noice/config/views.lua
  },


  -- vim surround 
  {"tpope/vim-surround"},
  -- {
  --   "kylechui/nvim-surround",
  --   version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   config = function()
  --       require("nvim-surround").setup({
  --           -- Configuration here, or leave empty to use defaults
  --       })
  --   end
  -- },
  
  -- dadbod
  {"tpope/vim-dadbod"},
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    config = function()
      vim.g.dadbod_ui_auto_execute_table_helpers = 1
      vim.g.dadbod_ui_win_position = "right"
    end,
    event = "VeryLazy",
  },

  -- nvim treesitter
  -- FIX: https://github.com/nvim-treesitter/nvim-treesitter/issues/914
  -- --- tries to configure nvim-treesitter before the package is fully loaded.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- ensures parsers are installed/updated
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("plugins.configs.treesitter")
    end,
  },

  -- nvim colorizer -- 
  -- color highlighter for your buffers, e.g(#000 will renders black color) 
  {
    "nvchad/nvim-colorizer.lua",
    config = function()
      local colorizer = require "colorizer"
      colorizer.setup {
        user_default_options = {
          tailwind = true, -- enables highlighting for Tailwind CSS color classes like bg-red-500 or text-green-400.
        },
      }
    end,
  },


  -- CMP
  -- blink cmp, check official site for more information on configuratino and customization: https://cmp.saghen.dev/installation
  -- TODO: add integretions with LSP
  {
    "saghen/blink.cmp",
    version = "1.*", -- recommended to use a stable release
    dependencies = {
      "L3MON4D3/LuaSnip",        -- snippet engine
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = { preset = "default" },
      completion = {
        documentation = { auto_show = false },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "tailwind_colors" }, 
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",   -- tailwindcss autocompletion plugins
    dependencies = {"saghen/blink.cmp"},
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },


  -- Git
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
    keys = {
      { "<leader>gg", ":Git<CR>", desc = "Git interactive window" },
      { "<leader>gs", ":Git status<CR>", desc = "Git status" },
      { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
      { "<leader>gp", ":Git push<CR>", desc = "Git push" },
      { "<leader>gl", ":Git pull<CR>", desc = "Git pull" },
    },
  },
  {
    "github/copilot.vim",   -- github free tier supports 2000 code completions per month and 50 agent mode : https://docs.github.com/en/copilot/how-tos/set-up/set-up-for-self.
    event = "InsertEnter",
    config = function()
      -- if you want to change default <Tab> mapping
      -- vim.g.copilot_no_tab_map = true
      -- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      --
    end,
  },


  -- lualine
  -- bottom statusline: 
  {
  "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- lazy-load after startup
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons
    config = function()
      require("plugins.configs.lualine") 
    end,
  },


  -- bufferline 
  -- tabs management
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("plugins.configs.bufferline")
    end,
  },

  -- theme 
  {
    "olimorris/onedarkpro.nvim",
    lazy=false,
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup {
        -- Main options --
        dark_theme = "onedark_dark", -- The default dark theme.
        light_theme = "onedark_light", -- The default light theme.
        styles = { -- You can set any of the style options below to "NONE" to disable it
          types = "italic", -- Style for types
          numbers = "NONE", -- Style for numbers
          comments = "italic", -- Style for comments
          strings = "NONE", -- Style for strings
          keywords = "bold", -- Style for keywords
          functions = "NONE", -- Style for functions
          variables = "NONE", -- Style for variables
        },
        options = {
          transparency = true, -- Disable setting background
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
        },
      }
      vim.cmd("colorscheme onedark")
    end,
  }


}, {
  defaults = { lazy = true }, -- lazy-load by default
  checker = { enabled = true }, -- auto-check for plugin updates
})

