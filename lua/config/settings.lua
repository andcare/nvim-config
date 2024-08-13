local opt = vim.opt


opt.clipboard = 'unnamedplus'
opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}


 -- TAB --
opt.expandtab = true	-- TABS are using spaces
opt.softtabstop = 2	-- number of spaces in TAB when editing
opt.shiftwidth = 2	-- insert 2 space when TAB is pressed
opt.tabstop = 2		-- number of visual spaces per TAB

 -- UI CONFIG -- 
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.splitbelow = true
opt.splitright = true
opt.showmode = false
opt.termguicolors = true

opt.laststatus = 3
opt.scrolloff = 10
opt.textwidth = 78
opt.updatetime = 250

 -- INDENT --
opt.autoindent = true
opt.breakindent = true
opt.smartindent = true
opt.wrap = true

 -- SEARCHING --
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

 -- SPELLING --
opt.encoding = 'UTF-8'

 -- FILE -- 
opt.swapfile = false
opt.title = true

 -- DIAGNOSTIC CONFIGURATION -- 
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 " ,
      [vim.diagnostic.severity.WARN] = "󰀪 " ,
      [vim.diagnostic.severity.INFO] = "󰌶 " ,
      [vim.diagnostic.severity.HINT] = " " ,
    },
  },
  float = {
    enable = true,
    border = 'rounded',
    focusable = false,
    style = 'minimal',
    source = 'if_many',
    prefix = ' 󱅶 '
  },
  severity_sort = true,
  underline = true,
  update_in_insert = false,
  virtual_text = false,
})
