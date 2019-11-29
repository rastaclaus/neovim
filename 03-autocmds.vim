autocmd FileType * set tabstop=2 | set shiftwidth=2
autocmd FileType python set tabstop=4 | set shiftwidth=4

" Save session on quitting Vim
autocmd VimLeave * NERDTreeClose
autocmd VimLeave * mksession! ~/.session.vim
