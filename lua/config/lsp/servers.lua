-------------------------------------------------
-----------       LUA-LS SETUP        -----------
-------------------------------------------------
require('lspconfig').lua_ls.setup {
  on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, enable)
    end
  end,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      },
    })
  end,
  settings = {
    Lua = {
      telemetry = { enable = false },
      completion = {
        callSnippet = 'Both',
        keywordSnippet = 'Both',
      },
      hint = { enable = true },
    },
  },
}

-------------------------------------------------
-----------       ESLINT SETUP        -----------
-------------------------------------------------
require('lspconfig').eslint.setup {
  on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, enable)
    end
    --vim.api.nvim_create_autocmd("BufWritePre", {
    --buffer = bufnr,
    --command = "EslintFixAll",
    --})
  end,
}

-------------------------------------------------
-----------       TSSERVER SETUP      -----------
-------------------------------------------------
require('lspconfig').tsserver.setup {
  single_file_support = false,
  init_options = {
    hostInfo = 'neovim',
    preferences = {
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'literal',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
  root_dir = function()
    return require('lspconfig.util').root_pattern('tsconfig.json', 'jsconfig.json', 'package.json', '.git')
  end,
}
