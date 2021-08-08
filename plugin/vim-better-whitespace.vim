" vim-better-whitespace
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

"Alternative to vim-better-whitespace, also strips trailing whitespace on save
"augroup DELETE_TRAILING_WHITESPACE_ON_WRITE
"	autocmd!
"	autocmd BufWritePre * %s/\s\+$//e
	"autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
"augroup END
