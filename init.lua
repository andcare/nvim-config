require 'config.bootstrap'
require 'config.settings'
require 'config.keybinds'
require 'config.autocmd'

require 'config.ui'

-- LSP SERVER AND COMPLETION --
require 'config.coding'
require 'config.lsp.mason'
require 'config.lsp.servers'

vim.cmd.colorscheme 'catppuccin'
