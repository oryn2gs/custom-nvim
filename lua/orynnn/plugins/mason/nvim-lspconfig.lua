-- nvim-lspconfig (Neovim 0.11+)
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
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
      },

      pyright = {
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
      },

      rust_analyzer = {},
      tsserver = {},
      html = {},
      cssls = {},
      eslint = {},
      emmet_ls = {},

      tailwindcss = {
        settings = {
          tailwindCSS = {
            classFunctions = { "cva", "cx" },
          },
        },
      },
    },
  },

  config = function(_, opts)
    ------------------------------------------------------------------------
    -- GLOBAL DIAGNOSTICS
    ------------------------------------------------------------------------
    vim.diagnostic.config {
      virtual_text = {
        spacing = 4,
        prefix = "●",
        -- if you only want to show virtual text for INFO and ERROR
        -- format = function(diagnostic)
        --   if
        --     diagnostic.severity == vim.diagnostic.severity.INFO
        --     or diagnostic.severity == vim.diagnostic.severity.ERROR
        --   then
        --     return diagnostic.message
        --   end
        --   return nil -- hide other severities (like WARN, HINT)
        -- end,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }

    ------------------------------------------------------------------------
    -- CAPABILITIES (Blink / snippets friendly)
    ------------------------------------------------------------------------
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities.textDocument.completion.completionItem = {
      documentationFormat = { "markdown", "plaintext" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" },
      },
    }

    ------------------------------------------------------------------------
    -- LspAttach: buffer-local behavior ONLY
    ------------------------------------------------------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("user.lsp", { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf
        if not client then
          return
        end

        -- enable inlay_hint at start up
        -- if client:supports_method "textDocument/inlayHint" then
        --   vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        -- end

        local map = vim.keymap.set
        local o = function(desc)
          return { desc = desc, noremap = true, silent = true }
        end

        map("n", "grd", vim.lsp.buf.definition, o "vim.lsp.buf.definition()")
        map("n", "gre", vim.lsp.buf.declaration, o "vim.lsp.buf.declaration()")
        map("n", "grp", vim.lsp.buf.hover, o "vim.lsp.buf.hover()")
        map("n", "grs", vim.lsp.buf.signature_help, o "vim.lsp.buf.signature_help()")
        map("n", "grh", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }, { bufnr = bufnr })
        end, o "toggle inlay hint")
      end,
    })

    ------------------------------------------------------------------------
    -- REGISTER + ENABLE SERVERS
    ------------------------------------------------------------------------
    for name, server in pairs(opts.servers) do
      vim.lsp.config(
        name,
        vim.tbl_deep_extend("force", {
          capabilities = capabilities,
        }, server)
      )
    end

    vim.lsp.enable(vim.tbl_keys(opts.servers))
  end,
}
