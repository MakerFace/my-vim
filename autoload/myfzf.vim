" myfzf
function! InNERDTree()
    return get(my-vim#mytools#InNERDTree)
endfunction

function! OpenFzf()
    if InNERDTree()
        wincmd p
    endif
    execute 'FZF'
endfunction

function! myfzf#Map()
    " map leader+ff to FZF
    nnoremap <silent> <expr> <leader>ff ':call OpenFzf()<CR>'
endfunction

command Fzf call OpenFzf()
