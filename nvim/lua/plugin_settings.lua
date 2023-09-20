-- Vimtex
vim.g['vimtex_syntax_conceal_disable'] = 1

-- LSP cmp
require('cmp_conf')

-- Treesitter
require('treesitter_conf')

require("nvim-autopairs").setup {}

require('indent_blankline').setup({
  char= '¦',
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = false
})
