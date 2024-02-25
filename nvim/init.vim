" vim.fn.stdpath("data")
lua require('vim_plug')
lua require('plugin_settings')
lua require('theme')
lua require('settings')
lua require('keybinds')
lua require('lsp')
lua require('status_line')
lua require('neotree')
lua require('my_funcs')
"lua require('jdtls_conf')
"lua require('java')
syntax on

" Show quotes in JSON files
let g:vim_json_conceal=0
" set conceallevel=0
autocmd BufEnter *.* set conceallevel=0

au BufRead,BufNewFile *.mo set filetype=modelica
au BufRead,BufNewFile *.tpl set filetype=susan

" Python buffer settings
augroup fileType_python
  autocmd!
  autocmd BufNewFile,BufRead *.py set autoindent
  autocmd Syntax python :syn keyword Keyword self
  au FileType python nnoremap <buffer> <leader>c 0i#<esc>
augroup END

" Highlight 81 char in line
highlight ColorColumn ctermbg=DarkBlue guibg=DarkBlue
call matchadd('ColorColumn', '\%81v', 100)

augroup extra_white_spaces
  au!
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertLeave * match ExtraWhitespace /\s\+$/
augroup END

" Find files and tab autocomplete
set path+=**
set wildmenu
nnoremap <leader>fi :find<Space>

" Vimtex settings
let g:vimtex_view_general_viewer = 'evince'

let g:python3_host_prog = "/usr/bin/python"

autocmd TermOpen * setlocal nonumber
