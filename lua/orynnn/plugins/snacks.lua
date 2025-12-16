-- snacks: https://github.com/folke/snacks.nvim
-- A collection of small quality of life improvements for Neovim.
-- 

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Snacks Diagnostics" },
    { "<leader>sl", function() Snacks.picker.lazy() end, desc = "Snacks Search for Plugin Spec" },
    { "<leader>s.",  function() Snacks.scratch() end, desc = "Snacks Toggle Scratch Buffer" },
    { "<leader>sb",  function() Snacks.scratch.select() end, desc = "Snacks Select Scratch Buffer" },
    { "<leader>sr", function() Snacks.rename.rename_file() end, desc = "Snacks Rename File" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Snacks jump to Next Reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Snacks jump to Prev Reference", mode = { "n", "t" } },
    -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Snacks Delete Buffer" },
    --git related
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Git Lazy - snacks" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log - Snacks" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line - Snacks" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks) - Snacks" },
    { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open) - Snacks" },
    { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all) - Snacks" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open) - Snacks" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all) - Snacks" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse - Snacks", mode = { "n", "v" } },

    -- TODO: configure lsp mappings

    -- neovoim news: this file shows breaking news about neovim updates
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },

    -- init globle keymaps
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
         -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end

          -- Override print to use snacks for `:=` command
          if vim.fn.has("nvim-0.11") == 1 then
            vim._print = function(_, ...)
              dd(...)
            end
          else
            vim.print = _G.dd 
          end

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ss")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>sw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>sR")
          Snacks.toggle.diagnostics():map("<leader>sD")
          Snacks.toggle.line_number():map("<leader>sn")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>sc")
          Snacks.toggle.treesitter():map("<leader>sT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>sq")
          Snacks.toggle.inlay_hints():map("<leader>sh")
          Snacks.toggle.indent():map("<leader>sg")
          Snacks.toggle.dim():map("<leader>sB")
        end,
      })
    end,

  },
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
