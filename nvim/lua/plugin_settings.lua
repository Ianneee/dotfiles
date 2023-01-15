-- Airline
vim.g['airline_powerline_fonts'] = '1'
vim.g['airline_theme'] = 'sonokai'

-- Vimtex
vim.g['vimtex_syntax_conceal_disable'] = 1

-- LSP cmp
require('cmp_conf')

-- Treesitter
--require('treesitter_conf')

require("nvim-autopairs").setup {}
