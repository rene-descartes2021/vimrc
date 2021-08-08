" ALE: {{{
let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 0
let g:ale_sign_error = '❌'
"let g:ale_sign_error = '•'
let g:ale_sign_warning = '⚠️'
"let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" ALE options:
" To not run ALE in real time and only on save, uncomment:
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0
" if you don't want linters to run on opening a file, uncomment:
"let g:ale_lint_on_enter = 0
