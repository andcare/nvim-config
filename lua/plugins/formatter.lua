return {
  {
    "stevearc/conform.nvim",
    lazy = true,
    dependencies = { "mason.nvim" },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {},
  },
}
