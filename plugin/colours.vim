" Colors: {{{
augroup ColorschemePreferences
	autocmd!
	" These preferences clear some gruvbox background colours, allowing transparency
	autocmd ColorScheme * highlight Normal		 ctermbg=NONE guibg=NONE
	autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
	autocmd ColorScheme * highlight Todo			 ctermbg=NONE guibg=NONE
	" Link ALE sign highlights to similar equivalents without background colours
	autocmd ColorScheme * highlight link ALEErrorSign		WarningMsg
	autocmd ColorScheme * highlight link ALEWarningSign ModeMsg
	autocmd ColorScheme * highlight link ALEInfoSign		Identifier
augroup END

" Use truecolor in the terminal, when it is supported
if has('termguicolors')
	"set termguicolors
endif

set background=dark
colorscheme gruvbox
" }}}

"let g:theprimeagen_colorscheme = "gruvbox"
