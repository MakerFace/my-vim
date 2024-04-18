" myfzf
function! OpenFzf()
    if mytools#InNERDTree()
        wincmd p
    endif
    execute 'FZF'
endfunction

function! myfzf#Map()
    " map leader+ff to FZF
    nnoremap <silent> <expr> <leader>ff ':call OpenFzf()<CR>'
endfunction

command Fzf call OpenFzf()
