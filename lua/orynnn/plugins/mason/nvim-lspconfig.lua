-- nvim-lspconfig (Neovim 0.11+ style)
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",

    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },

  config = function()
    --------------------------------------------------------------------------
    -- 1. GLOBAL DIAGNOSTICS (this was missing / misplaced before)
    --------------------------------------------------------------------------
    vim.diagnostic.config {
      virtual_text = {
        spacing = 2,
        prefix = "●",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }

    --------------------------------------------------------------------------
    -- 2. LspAttach: ONE place for buffer-local LSP behavior
    --------------------------------------------------------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("user.lsp", { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf

        -- Enable inlay hints automatically (if supported)
        if client and client:supports_method "textDocument/inlayHint" then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        -- Keymaps (buffer-local, correct scope)
        local map = vim.keymap.set
        local function opts(desc)
          return { desc = desc, noremap = true, silent = true }
        end

        map("n", "grd", vim.lsp.buf.definition, opts "Lsp go to defination")
        map("n", "gre", vim.lsp.buf.declaration, opts "Lsp got to declaration")
        map("n", "grp", vim.lsp.buf.hover, opts "Lsp toggle hover")
        map("n", "grh", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, opts "Enable inlay hint.")
        -- opts to toggle virtual
      end,
    })

    --------------------------------------------------------------------------
    -- 3. CAPABILITIES (Blink / snippets friendly)
    --------------------------------------------------------------------------
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = {
      -- text document
      textDocument = {
        completion = {
          dynamicRegistration = true,
          completionItem = {
            documentationFormat = { "markdown", "plaintext" },
            snippetSupport = true, -- needed of snippet support for cmp
            preselectSupport = true, -- preselect item in complition popup
            insertReplaceSupport = true, -- supports insert replace
            labelDetailsSupport = true,
            deprecatedSupport = true, -- marks depreciated items
            commitCharactersSupport = true, -- accepts commit chars
            --   tagSupport = { valueSet = { 1 } },
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits" },
            },
          },
        },
      },
      --- can do other settings here...
    }

    --------------------------------------------------------------------------
    -- 4. SERVER CONFIGS (declarative, no setup calls)
    --------------------------------------------------------------------------
    -- lua ls
    vim.lsp.config.lua_ls = {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = {
            globals = { "vim" },
          },
          hint = {
            enable = true,
            paramType = true,
            paramName = "All",
            setType = true,
            returnType = true,
          },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = { enable = false },
        },
      },
    }

    -- pyright
    vim.lsp.config.pyright = {
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "strict",
            autoSearchPaths = true,
          },
          inlayHints = {
            enabled = true,
            parameterHints = true,
            typeHints = true,
            functionReturnTypes = true,
            callArgumentNames = true,
          },
        },
      },
    }

    --- rust_analyzer
    vim.lsp.config.rust_analyzer = {
      capabilities = capabilities,
    }

    --- ts server
    vim.lsp.config.tsserver = {
      capabilities = capabilities,
    }

    vim.lsp.config.html = { capabilities = capabilities }
    vim.lsp.config.cssls = { capabilities = capabilities }
    vim.lsp.config.eslint = { capabilities = capabilities }
    vim.lsp.config.emmet_ls = { capabilities = capabilities }

    vim.lsp.config.tailwindcss = {
      capabilities = capabilities,
      settings = {
        tailwindCSS = {
          classFunctions = { "cva", "cx" },
        },
      },
    }

    --------------------------------------------------------------------------
    -- 5. ENABLE SERVERS (THIS IS REQUIRED)
    --------------------------------------------------------------------------
    vim.lsp.enable {
      "lua_ls",
      "pyright",
      "rust_analyzer",
      "tsserver",
      "html",
      "cssls",
      "tailwindcss",
      "eslint",
      "emmet_ls",
    }
  end,
}
