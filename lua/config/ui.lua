local status_ok, color_scheme = pcall(require, 'catppuccin')
if not status_ok then
  return
end

---------------------------------------------------------
--------              COLORSCHEME UI             --------
---------------------------------------------------------
require('catppuccin').setup {
  flavour = auto,
  background = {
    light = latte,
    dark = mocha,
  },
  transparent_background = true,
  term_colors = true,
  style = {
    conditionals = { 'italic' },
    variables = { 'italic' },
    functions = { 'bold', 'italic' },
  },
  integrations = {
    alpha = true,
    notify = true,
    mason = true,
    noice = true,
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
        ok = { 'underline' },
      },
    },
  },
}

---------------------------------------------------------
--------             CODE FORMATTER              --------
---------------------------------------------------------
require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettier', 'prettierd', stop_after_first = true },
    javascriptreact = { 'prettier', 'prettierd', stop_after_first = true },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

---------------------------------------------------------
--------                INDENT UI                --------
---------------------------------------------------------
require('mini.indentscope').setup {
  symbol = '╏',
}

---------------------------------------------------------
--------              STATUSLINE UI              --------
---------------------------------------------------------
local getAttachedLSP = function()
  local msg = 'No Active LSP'
  local LspClient = vim.lsp.get_clients()
  local currentBufferType = vim.api.nvim_get_option_value('filetype', { buf = 0 })

  if next(LspClient) == nil then
    return msg
  end

  for _, client in ipairs(LspClient) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, currentBufferType) ~= 1 then
      return client.name
    end
  end

  return msg
end

require('lualine').setup {
  options = {
    theme = 'catppuccin',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      {
        'fileformat',
        separator = { left = '', right = '█' },
        right_padding = 2,
      },
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      'filename',
    },
    lualine_x = {
      { getAttachedLSP, icon = ' LSP:' },
      'encoding',
      'filetype',
    },
    lualine_z = { { 'location', separator = { right = '', left = '' }, left_padding = 2 } },
  },
}
