" mytools
function! IsNERDTree()
    let cur_buf_name = expand('%:t')
    return cur_buf_name =~ '^NERD_tree_tab_\d\+$'
endfunction

function! EditVimrc()
    " judge whether in nerdtree window
    if IsNERDTree()
        " only one windows, and nerdtree
        " although unlikely
        if winnr('$') == 1
            vnew
        endif
        " jump to near window
        wincmd p
    endif
    execute 'edit ~/.vimrc'
endfunction

command Vimrc call EditVimrc()
