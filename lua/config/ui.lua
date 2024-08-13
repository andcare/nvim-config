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
