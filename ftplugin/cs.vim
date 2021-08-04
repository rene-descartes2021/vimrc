"augroup FTPLUGIN_CS
"	autocmd!
"	autocmd BufNewFile,BufRead *.cs setlocal errorformat=\ %#%f(%l\\\,%c):\ %m
"	autocmd BufNewFile,BufRead *.cs setlocal makeprg=dotnet\ build\ /property:GenerateFullPaths=true
"augroup END

"Reference: https://github.com/OmniSharp/omnisharp-vim/issues/386
compiler dotnet

function! MakeSolution() abort
let sln = shellescape(fnamemodify(OmniSharp#FindSolutionOrDir(), ':.'))
	call feedkeys(':make' . sln)
endfunction

nnoremap <silent> <buffer> <Space>mk :call MakeSolution()<CR>

" automatically open quickfix window after build is completed
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
