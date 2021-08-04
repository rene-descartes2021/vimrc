"Generic user-specific vim settings go in this file
"Plugin specific settings belong in plugin/<plugin-name>.vim
"Language specific settings belong in ftplugin/<language-identifier>.vim
let $TMPDIR = '/tmp/cache'

"Auto install vim-plug:
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Unfortunately vim-plug plugins are unable to be sandboxed in a repo's .vimrc,
"  and must be placed in the user's .vimrc
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'										"file browser
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}  "Requied for omnisharp-vim
"Plug 'OmniSharp/omnishaplugged'
Plug 'OmniSharp/omnisharp-vim'							"C#.NET language support
Plug 'nickspoons/vim-sharpenup'
Plug 'dense-analysis/ale'										"syntax checking
Plug 'liuchengxu/vista.vim'									"object browser
Plug 'valloric/MatchTagAlways'							"brace match highlighting
Plug 'jiangmiao/auto-pairs'									"brace auto-pairing
Plug 'mbbill/undotree'											"view on undo history
Plug 'gruvbox-community/gruvbox'						"syntax colours
Plug 'hauleth/asyncdo.vim'									"Async command support

" Initialize plugin system
call plug#end()

let mapleader = " "
nnoremap <leader><CR> :source ~/.vim/vimrc<CR>

" Auto indent your file:
nnoremap <F7> gg=G<C-o><C-o>
" Navigate Tabs
nnoremap <C-t><up> :tabr<cr>
nnoremap <C-t><down> :tabl<cr>
nnoremap <C-t><left> :tabp<cr>
nnoremap <C-t><right> :tabn<cr>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Support for different goto definitions for different file types:
augroup OMNISHARP_FILETYPES
	autocmd!
	autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
	autocmd FileType cs nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>

	autocmd FileType ts nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
	autocmd FileType html nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
augroup END

augroup DELETE_TRAILING_WHITESPACE_ON_WRITE
	autocmd!
	autocmd BufWritePre * %s/\s\+$//e
	"autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END


" MUST BE AT THE END OF THIS FILE-->
" Repo specific .vimrc, useful for project specific settings like
"  spaces-per-tab, which will take precedence over the user's vimrc
" https://phyks.me/2014/07/specific-vim-config-per-git-repository.html
let git_path = system("git rev-parse --show-toplevel 2>/dev/null")
let git_vimrc = substitute(git_path, '\n', '', '') . "/.vimrc"
if !empty(glob(git_vimrc))
	sandbox exec ":source " . git_vimrc
endif
"<--MUST BE AT THE END OF THIS FILE
