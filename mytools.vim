" mytools
function! IsNERDTreeOpened()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

function! EditVimrc()
    if IsNERDTreeOpened()
        echom "nerdtree opened"
        if winnr('$') > 1
            wincmd p
        else
            vnew
        endif
    else
        echom "nerdtree has not opened"
    endif
    execute 'edit ~/.vimrc'
endfunction

command Vimrc call EditVimrc()
