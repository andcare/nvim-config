local capabilities = require('cmp_nvim_lsp').default_capabilities()

-------------------------------------------------
-----------       LUA-LS SETUP        -----------
-------------------------------------------------
require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, enable)
    end
  end,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = { checkThirdParty = false },
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
  capabilities = capabilities,
  settings = {
    packageManager = 'npm',
  },
}

-------------------------------------------------
-----------       TSSERVER SETUP      -----------
-------------------------------------------------
require('lspconfig').tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr })
    end
  end,
  single_file_support = false,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
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
  init_options = {
    hostInfo = 'neovim',
  },
}
