" OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
	let g:OmniSharp_popup_options = {
	\ 'winhl': 'Normal:NormalFloat'
	\}
else
	let g:OmniSharp_popup_options = {
	\ 'highlight': 'Normal',
	\ 'padding': [0, 0, 0, 0],
	\ 'border': [1]
	\}
endif
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

"if s:using_snippets
"  let g:OmniSharp_want_snippet = 1
"endif

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
" }}}

let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_autoselect_existing_sln = 1
let g:OmniSharp_highlighting = 3
let g:OmniSharp_diagnostic_exclude_paths = [ 'Temp[/\\]', 'obj[/\\]', '\.nuget[/\\]' ]
"let g:OmniSharp_fzf_options = { 'down': '10'  }']]]' ]

augroup OMNISHARP_CODEFORMAT
	autocmd!
	autocmd BufWritePre *.cs :OmniSharpCodeFormat
augroup END

" Support for different goto definitions for different file types:
augroup OMNISHARP_FILETYPES
	autocmd!
	"autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
	"autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
	"autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
	"autocmd FileType cs nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>

	"autocmd FileType ts nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
	"autocmd FileType html nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
augroup END
