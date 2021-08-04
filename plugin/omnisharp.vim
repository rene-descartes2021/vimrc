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
