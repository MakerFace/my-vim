" mytools
function! IsNERDTree()
    let cur_buf_name = expand('%:t')
    return cur_buf_name =~ '^NERD_tree_tab_\d\+$'
endfunction

function! InNERDTree()
    " judge whether in nerdtree window
    if IsNERDTree()
        " only one windows, and nerdtree
        " although unlikely
        if winnr('$') == 1
            vnew
        endif
        return 1
    endif
    return 0
endfunction

function! EditVimrc()
    if InNERDTree()
        " jump to near window
        wincmd p
    endif
    execute 'edit ~/.vimrc'
endfunction

command InNERDTree call InNERDTree()
command Vimrc call EditVimrc()
