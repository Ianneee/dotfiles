lua require('vim_plug')
lua require('plugin_settings')
lua require('theme')
lua require('settings')
lua require('keybinds')
lua require('lsp')

syntax on

" Show quotes in JSON files
let g:vim_json_conceal=0
set conceallevel=0

" Python buffer settings
augroup fileType_python
  autocmd!
  autocmd BufNewFile,BufRead *.py set autoindent
  autocmd Syntax python :syn keyword Keyword self
  au FileType python nnoremap <buffer> <leader>c 0i#<esc>
augroup END

" Highlight 81 char in line
highlight ColorColumn ctermbg=DarkBlue
call matchadd('ColorColumn', '\%81v', 100)

augroup extra_white_spaces
  au!
  highlight ExtraWhitespace ctermbg=red
  match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertLeave * match ExtraWhitespace /\s\+$/
augroup END

" Find files and tab autocomplete
set path+=**
set wildmenu
nnoremap <leader>fi :find<Space>
