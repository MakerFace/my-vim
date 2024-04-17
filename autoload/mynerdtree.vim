" mynerdtree.vim
function! OpenWindows()
    " Start NERDTree and leave the cursor in it.
    autocmd VimEnter * NERDTree
    " Start NERDTree when Vim is started without file arguments.
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
    " Start NERDTree. If a file is specified, move the cursor to its window.
    autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
    " Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
    " Start NERDTree when Vim starts with a directory argument.
    " and back to NERDTree
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
        \ execute 'NERDTree' argv()[0] | wincmd p | enew | wincmd p | execute 'cd '.argv()[0] | endif
endfunction

function! CloseWindows()
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
endfunction

function! OneTree()
    " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
    autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
                \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif" Open the existing NERDTree on each new tab.
    " Open the existing NERDTree on each new tab.
    autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
endfunction

function! ChangeDir()
    let path = expand('%:p:h')
    if isdirectory(path)
        execute 'cd ' . path
    endif
endfunction


function! mynerdtree#Map()
    nnoremap <silent> <expr> <leader>ft ':NERDTreeToggle<CR>'
    map <silent> <F3> :NERDTreeToggle<CR>
    " change vim workdir same to nerdtree
    autocmd FileType nerdtree nnoremap <buffer> <leader>cd :cd %:p:h<CR>
    call ChangeDir()
    call OpenWindows()
    call CloseWindows()
endfunction
