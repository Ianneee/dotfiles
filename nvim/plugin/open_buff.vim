if exists('g:close_open_buff')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

hi def link WhidHeader      Number
hi def link WhidSubHeader   Identifier

command! CloseOpenBuff lua require'buffer_closer'.close_open_buff()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:close_open_buff = 1
