" myshell
function! OpenShellBelow()
    execute ':botright term'
endfunction

function! OpenShellTop()
    execute ':topleft term'
endfunction

function! myshell#Map()
    nnoremap <silent><expr> <leader>' ':call OpenShellBelow()<CR>'
    nnoremap <silent><expr> <leader>" ':call OpenShellTop()<CR>'
endfunction
