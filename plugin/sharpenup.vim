" Sharpenup: {{{
" All sharpenup mappings will begin with this, eg.: `<Space>os`=>`<Space>osgd`
let g:sharpenup_map_prefix = '<Space>'

"Default mappings:
"nmap gd <Plug>(omnisharp_go_to_definition)
"nmap <prefix>fu <Plug>(omnisharp_find_usages)
"nmap <prefix>fi <Plug>(omnisharp_find_implementations)
"nmap <prefix>pd <Plug>(omnisharp_preview_definition)
"nmap <prefix>pi <Plug>(omnisharp_preview_implementations)
"nmap <prefix>t <Plug>(omnisharp_type_lookup)
"nmap <prefix>d <Plug>(omnisharp_documentation)
"nmap <prefix>fs <Plug>(omnisharp_find_symbol)
"nmap <prefix>ft <Plug>(omnisharp_find_type)
"nmap <prefix>fx <Plug>(omnisharp_fix_usings)
"nmap <C-\> <Plug>(omnisharp_signature_help)
"imap <C-\> <Plug>(omnisharp_signature_help)
"nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
"nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
"nmap <prefix>gcc <Plug>(omnisharp_global_code_check)
"nmap <prefix>ca <Plug>(omnisharp_code_actions)
"xmap <prefix>ca <Plug>(omnisharp_code_actions)
nmap <Leader><space> <Plug>(omnisharp_code_actions)
xmap <Leader><space> <Plug>(omnisharp_code_actions)
"nmap <silent> <buffer> <prefix>. <Plug>(omnisharp_code_action_repeat)
"xmap <silent> <buffer> <prefix>. <Plug>(omnisharp_code_action_repeat)
"nmap <prefix>nm <Plug>(omnisharp_rename)
nmap <F2> <Plug>(omnisharp_rename)
"nmap <prefix>= <Plug>(omnisharp_code_format)
nmap <Leader>cf <Plug>(omnisharp_code_format)
"nmap <prefix>re <Plug>(omnisharp_restart_server)
"nmap <prefix>ss <Plug>(omnisharp_start_server)
"nmap <prefix>sp <Plug>(omnisharp_stop_server)

nmap <Leader>rt <Plug>(omnisharp_run_test)
nmap <Leader>rT <Plug>(omnisharp_run_tests_in_file)

let g:sharpenup_statusline_opts = { 'Text': '%s (%p/%P)' }
let g:sharpenup_statusline_opts.Highlight = 0

augroup OmniSharpIntegrations
	autocmd!
	autocmd User OmniSharpProjectUpdated,OmniSharpReady call lightline#update()
augroup END
" }}}
