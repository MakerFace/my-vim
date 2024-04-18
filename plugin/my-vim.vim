" mytools
if exists("g:loaded_my_vim_plugin")
    finish
endif
let g:loaded_my_vim_plugin = 1

call mynerdtree#Map()

call mywinope#Map()

call mybuffer#Map()

call mytabs#Map()

call mycoc#Map()

call myfzf#Map()

call myshell#Map()

command InNERDTree call mytools#InNERDTree()
command Vimrc call mytools#EditVimrc()

