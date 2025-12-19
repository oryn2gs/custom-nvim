-- nvim treesitter
-- for debugging: check the treesitter highliter `lua print(vim.inspect(vim.treesitter.highlighter.active[0]))`
return { 
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local ts = require "nvim-treesitter"
      -- ts.setup () -- to setup tree sitter
      local langs = {
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "jsx",
        "json",
        "json5",
        "jsdoc",
        "svelte",
        "vue",
        "angular",
        "python",
        "scss",
        "htmldjango",
        "jinja",
        "go",
        "rust",
        "lua",
        "luadoc",
        "c",
        "c_sharp",
        "java",
        "javadoc",
        "php",
        "phpdoc",
        "swift",
        "solidity",
        "graphql",
        "prisma",
        "sql",
        "editorconfig",
        "vim",
        "vimdoc",
        "tmux",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "dockerfile",
        "helm",
        "caddy",
        "nginx",
        "terraform",
        "markdown",
        "markdown_inline",
        "yaml",
        "csv",
        "toml",
        "xml",
        "arduino",
        "promql",
        "regex",
        "bash",
        "zsh",
        "fish",
        "awk",
        "latex", "norg", "typst"
      }
      ts.install(langs)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = langs,
        callback = function()
          -- syntax highlighting, provided by Neovim
          vim.treesitter.start()
          -- folds, provided by Neovim
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.wo.foldmethod = 'expr'
          vim.wo.foldlevel = 99         -- arbitrary high number
          -- indentation, provided by nvim-treesitter
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })


    end,

  },
  {
    -- PERF: test textobject mapping
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch= "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
    end,
    config = function()
      local ntextobjects = require "nvim-treesitter-textobjects"
      ntextobjects.setup {
        select = {
          enable = true,
          lookahead = true,  -- jumps forward to the next object
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["as"] = "@local.scope",
          },
          selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = '<c-v>',
          },

        },
        include_surrounding_whitespace = false
      }
      -- keymaps
      -- You can use the capture groups defined in `textobjects.scm`
      -- vim.keymap.set({ "x", "o" }, "af", function()
      --   require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
      -- end)
    end
  }
}

