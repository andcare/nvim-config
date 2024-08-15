----------------------------------------------------
---------          FORMATTER UI            ---------
----------------------------------------------------

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettier' },
  },
  format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
  format_after_save = { 'fallback' },
}

----------------------------------------------------
---------          TREESITTER UI           ---------
----------------------------------------------------
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'javascript', 'typescript' },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CTRL>', -- set to `false` to disable one of the mappings
      node_incremental = '<CTRL>',
      scope_incremental = false,
      node_decremental = '<BS>',
    },
  },
}

----------------------------------------------------
---------          COMPLETION UI           ---------
----------------------------------------------------
local cmp = require 'cmp'
require('cmp').setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
      vim.snippet.expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<cr>'] = cmp.mapping.confirm { select = true },
  },
}

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' },
      },
    },
  }),
})

----------------------------------------------------
---------          AUTO PAIR UI            ---------
----------------------------------------------------
require('mini.pairs').setup {
  modes = { insert = true, command = true, terminal = false },
  -- skip autopair when next character is one of these
  skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
  -- skip autopair when the cursor is inside these treesitter nodes
  skip_ts = { 'string' },
  -- skip autopair when next character is closing pair
  -- and there are more closing pairs than opening pairs
  skip_unbalanced = true,
  -- better deal with markdown code blocks
  markdown = true,
}

----------------------------------------------------
---------            GITSIGNS UI           ---------
----------------------------------------------------
require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 250,
  },
  signs = {
    add = { text = '▎' },
    change = { text = '▎' },
    delete = { text = '' },
    topdelete = { text = '' },
    changedelete = { text = '▎' },
    untracked = { text = '▎' },
  },
  signs_staged = {
    add = { text = '▎' },
    change = { text = '▎' },
    delete = { text = '' },
    topdelete = { text = '' },
    changedelete = { text = '▎' },
  },
}

-- Hello to the world of knowledge
