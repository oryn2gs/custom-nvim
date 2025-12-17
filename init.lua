if vim.g.vscode then
  -- VSCode extension
  vim.cmd [[source $HOME/.config/nvim/vscode/settings.vim]]
  -- easy motion  install
else
  -- Entry point for Neovim
  -- Loads core settings first, then plugins

  -- Core settings
  require "orynnn.core.options" -- vim.o options
  require "orynnn.core.keymaps" -- custom keymaps
  require "orynnn.core.autocmds" -- autocmds
  require "orynnn.core.highlights" -- autocmds
  require("orynnn.core.commands").setup()

  -- Plugins
  require "orynnn.lazy" -- Lazy.nvim bootstrap and plugin loader
end
