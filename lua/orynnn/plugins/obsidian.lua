return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter",
  },
  -- Adding keymaps here allows lazy.nvim to load the plugin only when you press them
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian Note" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open in Obsidian App" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian Notes" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch" },
    { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Insert Template" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show Backlinks" },
    { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Insert Link" },
    { "<leader>of", "<cmd>ObsidianFollowLink<cr>", desc = "Follow Link" },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/workspace/obsidian/vaults/personal/",
      },
    },

    -- Optional, if you keep notes in a specific subdirectory of your vault.
    notes_subdir = "00-Draft",
    new_notes_location = "notes_subdir",
    disable_frontmatter = false, -- disbale obsidian formatter

    -- Optional, set to true if you use the Obsidian Advanced URI plugin.
    -- https://github.com/Vinzent03/obsidian-advanced-uri
    use_advanced_uri = false,
    -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
    open_app_foreground = true,

    ui = {
      enable = false, -- set to true to enable syntax features
    },

    -- Specify how to handle attachments.
    attachments = {
      -- The default folder to place images in via `:ObsidianPasteImg`.
      img_folder = "08-Assets", -- This is the default
    },

    -- Optional, for templates (see below).
    templates = {
      folder = "07-Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
  },
}
