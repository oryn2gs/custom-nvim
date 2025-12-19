-- nvim-lspconfig with Mason & environment-aware setup
-- Place this in your `plugins` folder, or integrate with Lazy.nvim

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  keys = function()
    -- configure keymap for lsp defination
    return {
      {
        "<leader>ld",
        function()
          vim.lsp.buf.definition()
        end,
        desc = "Lsp jump to defination",
      },
      {
        "<leader>lD",
        function()
          vim.lsp.buf.declaration()
        end,
        desc = "Lsp jump to declaration",
      },
      {
        "<leader>lt",
        function()
          vim.lsp.buf.type_defination()
        end,
        desc = "Lsp jump to type defination",
      },
      {
        "<leader>li",
        function()
          vim.lsp.buf.implementation()
        end,
        desc = "Lsp jump to implementation",
      },
      {
        "<leader>lp",
        function()
          vim.lsp.buf.hover()
        end,
        desc = "Lsp peek/hover defination",
      },
      {
        "<leader>lr",
        function()
          vim.lsp.buf.rename()
        end,
        desc = "Lsp rename",
      },
      {
        "<leader>ls",
        function()
          vim.lsp.buf.signature_help()
        end,
        desc = "Lsp signature help",
      },
    }
  end,
  config = function()
    local lspconfig = vim.lsp.config
    -- Define the servers and their custom settings
    local servers = {
      lua_ls = {
        root_dir = function(fname)
          return lspconfig.util.root_pattern("lua-project.toml", ".git")(fname)
        end,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              path = vim.split(package.path, ";"),
            },
            diagnostics = {
              globals = { "vim" },
              disable = { "lowercase-global" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              typeCheckingMode = "strict", -- enabled to global type checking ("off", "basic", "standard", "strict")
            },
            disableOrganizeImports = true,
            autoImportCompletions = true, -- Enable auto imports
            inlayHints = { -- Enable inlay hints
              enabled = true,
              parameterHints = true,
              typeHints = true,
              chainingHints = true,
              otherHints = true,
            },
          },
        },
      },
      rust_analyzer = {},
      tsserver = {},
      html = {},
      cssls = {},
      tailwindcss = { settings = { tailwindCSS = { classFunctions = { "cva", "cx" } } } },
      eslint = {},
      emmet_ls = {},
    }

    -- attach handlers
    local on_attach = function(client, bufnr)
      -- Enable inlay hints if the LSP supports it
      -- if client.name == "rust_analyzer" then
      --   vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      -- end
      if client.supports_method "textDocument/inlayHint" then
        vim.lsp.inlay_hint(bufnr, true)
      end
    end

    --  capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem = {
      documentationFormat = { "markdown", "plaintext" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = { valueSet = { 1 } },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      },
    }

    -- Register servers
    for name, cfg in pairs(servers) do
      lspconfig[name].setup(vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities,
      }, cfg))
    end
    -- vim.lsp.enable(vim.tbl_keys(servers))

    -- diagonostic settings
    vim.diagnostic.config {
      virtual_text = { prefix = "●", spacing = 2 },
      -- signs = true,
      -- underline = true,
      update_in_insert = false,
    }
  end,
}

-- -- nvim-lspconfig with Mason & environment-aware setup
-- -- Place this in your `plugins` folder, or integrate with Lazy.nvim
--
-- return {
--   "neovim/nvim-lspconfig",
--   dependencies = {
--     "mason-org/mason.nvim",
--     "mason-org/mason-lspconfig.nvim",
--   },
--   config = function()
--     local lspconfig = require "lspconfig"
--     -- Define the servers and their custom settings
--     local servers = {
--       lua_ls = {
--         settings = {
--           Lua = {
--             runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
--             diagnostics = { globals = { "vim" }, disable = { "lowercase-global" } },
--             workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
--             telemetry = { enable = false },
--           },
--         },
--       },
--       pyright = {
--         settings = {
--           python = {
--             analysis = {
--               autoSearchPaths = true,
--               typeCheckingMode = "strict", -- enabled to global type checking ("off", "basic", "standard", "strict")
--             },
--             disableOrganizeImports = true,
--             autoImportCompletions = true, -- Enable auto imports
--             inlayHints = { -- Enable inlay hints
--               enabled = true,
--               parameterHints = true,
--               typeHints = true,
--               chainingHints = true,
--               otherHints = true,
--             },
--           },
--         }
--       },
--       rust_analyzer = {},
--       tsserver = {},
--       html = {},
--       cssls = {},
--       tailwindcss = { settings = { tailwindCSS = { classFunctions = { "cva", "cx" } } } },
--       eslint = {},
--       emmet_ls = {},
--     }
--
--
--
--
--     local on_attach = function(client, bufnr)
--       print(client.name .. " attached!")  -- <- check if this prints
--       -- Enable inlay hints if the LSP supports it
--       if client.name == "rust_analyzer" then
--         vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
--       end
--     end
--
--     -- blink-cmp capabilities
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     capabilities = require("saghen/blink.cmp").update_capabilities(capabilities)  -- blink-cmp integration
--
--     -- Register all servers
--     for name, cfg in pairs(servers) do
--       lspconfig[name].setup(vim.tbl_deep_extend("force", {
--         on_attach = on_attach,
--         capabilities = capabilities,
--         flags = { debounce_text_changes = 150 },
--       }, cfg))
--     end
--
--     vim.diagnostic.config {
--       virtual_text = { prefix = "●", spacing = 2 },
--       signs = true,
--       underline = true,
--       update_in_insert = false,
--     }
--   end,
-- }
