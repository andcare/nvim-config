return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason.nvim',
      'mason-lspconfig.nvim',
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
  },
  {
    'williamboman/mason.nvim',
    lazy = true,
    cmd = 'Mason',
  },
}
