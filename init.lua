if vim.g.vscode then
  -- VSCode extension
  vim.cmd [[source $HOME/.config/nvim/vscode/settings.vim]]
  -- easy motion  install
else
  -- Entry point for Neovim
  -- Loads core settings first, then plugins

  -- Core settings
  require "core.options" -- vim.o options
  require "core.keymaps" -- custom keymaps
  require "core.autocmds" -- autocmds
  require "core.highlights" -- autocmds

  -- Plugins
  require "plugins.lazy" -- Lazy.nvim bootstrap and plugin loader
end
