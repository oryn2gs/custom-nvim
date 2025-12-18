-- nvim-autopairs
-- check : https://github.com/windwp/nvim-autopairs
--
-- INFO:  autotag HTML and TSX
-- check: https://github.com/windwp/nvim-ts-autotag
-- 
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    disable_filetype = { "TelescopePrompt" , "vim" }, -- defaults values
    check_ts = true,
    ts_config = {
      lua = { "string" },
      -- java = false, --don't check java ts 
    },
    -- checks if the next pair is close bracket and does nothave bracket pair, it won't ad dpair bracket 
    enable_check_bracket_line = true,  
    -- :h nvim-autopairs --fastwarp section
    fast_wrap = {
      map = '<C-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = '$',
      before_key = 'h',
      after_key = 'l',
      cursor_pos_before = true,
      avoid_move_to_end = true, -- stay for direct end_key use
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      manual_position = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },

  },
}

