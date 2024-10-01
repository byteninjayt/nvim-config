require('config').load()
require('keymap').load()

require('plugins.packer')
require("plugins.lualine")

require("plugins.mason").setup()
require('plugins.treesitter')
require('plugins.lsp-zero')
require('plugins.cmp')
