local opts = { noremap = true, silent = true }
local keymap = vim.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-----------------------------------------------------------------------
----------                SPLIT VIEW KEYMAPS                 ----------
-----------------------------------------------------------------------
keymap.set('n', '<leader>[', ':vsplit<CR>', opts)
keymap.set('n', '<leader>]', ':split<CR>', opts)

keymap.set('n', '<C-h>', '<C-w><C-h>', opts)
keymap.set('n', '<C-l>', '<C-w><C-l>', opts)
keymap.set('n', '<C-j>', '<C-w><C-j>', opts)
keymap.set('n', '<C-k>', '<C-w><C-k>', opts)

keymap.set('n', '<C-left>', ':vertical resize -2<CR>', opts)
keymap.set('n', '<C-right>', ':vertical resize +2<CR>', opts)
keymap.set('n', '<C-up>', ':resize +2<CR>', opts)
keymap.set('n', '<C-down>', ':resize -2<CR>', opts)

-----------------------------------------------------------------------
----------                  FILES KEYMAPS                    ----------
-----------------------------------------------------------------------
keymap.set('n', '<C-s>', function()
  vim.cmd 'w'
end, opts)

-----------------------------------------------------------------------
----------                 BUFFER KEYMAPS                    ----------
-----------------------------------------------------------------------
keymap.set('n', '<S-h>', ':bprevious<CR>', opts)
keymap.set('n', '<S-l>', ':bnext<CR>', opts)
keymap.set('n', '<leader>bd', ':bdelete<CR>', opts)

-----------------------------------------------------------------------
----------                   TABS KEYMAPS                    ----------
-----------------------------------------------------------------------
keymap.set('n', '<leader>tn', ':tabnew<CR>', opts)
keymap.set('n', '<leader>tc', ':tabclose<CR>', opts)
keymap.set('n', '<A-,>', ':tabprevious<CR>', opts)
keymap.set('n', '<A-.>', ':tabnext<CR>', opts)

-----------------------------------------------------------------------
----------              PACKAGE MANAGER KEYMAPS              ----------
-----------------------------------------------------------------------
keymap.set('n', '<leader>M', ':Mason<CR>', opts)
keymap.set('n', '<leader>L', ':Lazy<CR>', opts)

-----------------------------------------------------------------------
----------                FORMATTER KEYMAPS                  ----------
-----------------------------------------------------------------------
keymap.set('n', '<leader>cF', function()
  require('conform').format { async = true }
end, opts)

-----------------------------------------------------------------------
----------                TELESCOPE KEYMAPS                  ----------
-----------------------------------------------------------------------
keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
keymap.set('n', '<leader>ffb', ':Telescope buffers<CR>', opts)
keymap.set('n', '<leader>tgc', ':Telescope git_commits<CR>', opts)
keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', opts)
keymap.set('n', '<leader>fcb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', opts)

-----------------------------------------------------------------------
----------                  LAZYGIT KEYMAPS                  ----------
-----------------------------------------------------------------------
keymap.set('n', '<leader>lg', ':LazyGit<CR>', opts)
