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
Plug 'puremourning/vimspector'							"Debugger integration
Plug 'liuchengxu/vista.vim'									"object browser
Plug 'ntpeters/vim-better-whitespace'				"whitespace trimmer/viewer
Plug 'valloric/MatchTagAlways'							"brace match highlighting
Plug 'jiangmiao/auto-pairs'									"brace auto-pairing
Plug 'mbbill/undotree'											"view on undo history
Plug 'gruvbox-community/gruvbox'						"syntax colours
Plug 'hauleth/asyncdo.vim'									"Async command support
Plug 'itchyny/lightline.vim'								"Statusline
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'maximbaz/lightline-ale'
Plug 'tpope/vim-eunuch'											"wrapper for shell commands

"Initialize plugin system
call plug#end()

let mapleader = " "
nnoremap <leader><CR> :source ~/.vim/vimrc<CR>

" Auto indent your file:
nnoremap <F7> gg=G<C-o><C-o>
" Navigate Tabs (tmux?)
nnoremap <C-t><up> :tabr<cr>
nnoremap <C-t><down> :tabl<cr>
nnoremap <C-t><left> :tabp<cr>
nnoremap <C-t><right> :tabn<cr>
" Navigate windows:
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
" Make Y behave like the rest of the capital letters:
nnoremap Y y$
" Keep vim centered when searching, next, previous, join:
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" Quick fix centering:
nnoremap <C-j> :cnext<CR>zzzv
nnoremap <C-k> :cprev<CR>zzzv
" Undo will now be broken up by these break points instead of undoing all
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" Relative jumps will now be more intuitive
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
" Moving text, visual block, single lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"inoremap <C-j> <esc>:m .+1<CR>==
"inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" MUST BE AT THE END OF THIS FILE-->
" Repo specific .vimrc, useful for project specific settings like
"  spaces-per-tab, which will take precedence over the user's vimrc
" I've seen one alternative to getting a repo-specific .vimrc but this works.
" https://phyks.me/2014/07/specific-vim-config-per-git-repository.html
let git_path = system("git rev-parse --show-toplevel 2>/dev/null")
let git_vimrc = substitute(git_path, '\n', '', '') . "/.vimrc"
if !empty(glob(git_vimrc))
	sandbox exec ":source " . git_vimrc
endif
"<--MUST BE AT THE END OF THIS FILE
