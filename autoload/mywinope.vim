" mywindow operate
function! MoveWindowBoundary()
    let win_pos = get(winnr(), 'col', 0)

    " window on left side
    if win_pos == 1
        vertical resize -1
    else
        vertical resize -1
    endif

endfunction

function! mywinope#Map()
    " set statusline display mode: 
    " 0 only display when multi-windows
    " 1 alway dispaly
    " 2 same to 1, but adjust according to content
    " without covering the content
    set laststatus=2
    set statusline+=%{winnr()}

    for i in range(1, 9)
        let map = "<leader>" . i
        let cmd = "':" . i . "wincmd w<CR>'"
        execute "nnoremap <silent> <expr> " . map . " " . cmd
    endfor

    " circle windows
    nnoremap <leader>ww <C-w>w
    " no go to next windws
    " create new window
    " nnoremap <leader>wn <C-w>n
    " go to previous window
    nnoremap <leader>wp <C-w>p

    nnoremap <expr> <leader>wd ':q<CR>'

    " maximize window
    nnoremap <leader>wm <C-w>_

    " equally divided windows
    nnoremap <leader>w= <C-w>=

    " increase window height
    nnoremap <leader>wk <C-w>+
    " reduce window heigh
    nnoremap <leader>wj <C-w>-
    " increase window width
    nnoremap <leader>wl <C-w>>
    " reduce window width
    nnoremap <leader>wh <C-w><

    " move window to top, and maximize
    nnoremap <leader>wK <C-w>K
    " move window to bottom, and maximize
    nnoremap <leader>wJ <C-w>J
    " move window to left, and maximize
    nnoremap <leader>wH <C-w>H
    " move window to right, and maximize
    nnoremap <leader>wL <C-w>L
    " move window to new tab
    nnoremap <leader>wT <C-w>T
endfunction
