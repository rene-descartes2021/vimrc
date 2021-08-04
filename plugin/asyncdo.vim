"Display status of :AsyncDo (asyncdo#run) in status line:
let &statusline .= "%{exists('g:asyncdo')?'runing':''}"
"Make makeprg (:make) run async
command! -bang -nargs=* -complete=file Make call asyncdo#run(<bang>0, &makeprg, <f-args>)
"Make :grep run async
command! -bang -nargs=* -complete=dir Grep call asyncdo#run(
	\ <bang>0,
	\ { 'job': &grepprg, 'errorformat': &grepformat  },
	\ <f-args>)
