-- akinsho/toggleterm.nvim
-- https://github.com/akinsho/toggleterm.nvim
return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy=false,
    keys = function() 
      local  term_modes = {"n", "t"}
      return {
        { "<leader>tt","<cmd>ToggleTerm direction=vertical<CR>", mode = term_modes, desc = "Terminal toggle default(vertical)"},
        { "<leader>tT","<cmd>ToggleTerm direction=horizontal<CR>", mode = term_modes, desc = "Terminal toggle horizontal"},
        { "<leader>tf","<cmd>ToggleTerm direction=float<CR>", mode = term_modes, desc = "Terminal toggle floating"},
        -- { '<Esc>', [[<C-\><C-n>]],  noremap = true, silent = true, mode= "t"},
      }
    end,
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return math.floor(vim.o.lines * 0.5)
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.5)
        end
      end,
      direction = "vertical", -- 'vertical' | 'horizontal' | 'tab' | 'float',
      start_in_insert = true, -- starts in insert mode
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = "single", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
        width = function() return math.floor(vim.o.columns * 0.8) end,
        height = function() return math.floor(vim.o.lines * 0.8) end,
        winblend = 50,
        title_pos = 'center',-- 'left' | 'center' | 'right', position of the title of the floating window
      },
    }
  }

}

