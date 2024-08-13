return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'mason.nvim',
      'mason-lspconfig.nvim'
    }
  },
  {
    "williamboman/mason-lspconfig.nvim"
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
  }
}
