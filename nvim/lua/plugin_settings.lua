-- Vimtex
vim.g['vimtex_syntax_conceal_disable'] = 1

-- LSP cmp
require('cmp_conf')

-- Snippets conf
require('snippets')

-- Treesitter
require('treesitter_conf')

require("nvim-autopairs").setup {}

require('ibl').setup({
  indent = { char= '¦' },
  scope = { enabled = false},
  --show_trailing_blankline_indent = false,
  --show_first_indent_level = false,
  --use_treesitter = true,
})

require('telescope').setup{
  defaults = {
     sorting_strategy = 'ascending',
  },
}
