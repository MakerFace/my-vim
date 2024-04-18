" myshortcuts

" direction mapping
function! DirectionMap()
    inoremap <C-a> <Home>
    cnoremap <C-a> <Home>
    inoremap <C-e> <End>
    cnoremap <C-e> <End>
    inoremap <C-h> <Left>
    cnoremap <C-h> <Left>
    inoremap <C-l> <Right>
    cnoremap <C-l> <Right>
    inoremap <C-j> <Down>
    cnoremap <C-j> <Down>
    inoremap <C-k> <Up>
    cnoremap <C-k> <Up>
endfunction

" hls helper function
function SwitchHightLight()
    if &hlsearch
        execute ':set nohls'
    else
        execute ':set hls'
    endif
endfunction

function! SearchMap()
    nnoremap <silent> <C-n> :call SwitchHightLight()<CR>
endfunction

function! myshortcuts#Map()
    call DirectionMap()
    call SearchMap()
endfunction
