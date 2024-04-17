" mybuffer operate

function! mybuffer#Map()
    nnoremap <expr> <leader>bn ':bn<CR>'
    nnoremap <expr> <leader>bp ':bp<CR>'
    nnoremap <expr> <leader>bd ':bd<CR>'
    nnoremap <expr> <leader>bdn ':bn \| bd #<CR>'

    nnoremap <expr> <leader>sbn ':sbnext<CR>'
    nnoremap <expr> <leader>sbp ':sbprevious<CR>'
endfunction

