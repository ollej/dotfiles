if has("autocmd")

    " Load templates based on extensions of file
    autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

    " Set file types for a bunch of files to get syntax highlighting
    autocmd BufNewFile,BufRead *.txt  set filetype=txt
    autocmd BufNewFile,BufRead *.nse  set filetype=lua
    autocmd BufNewFile,BufRead *.ru   set filetype=ruby
    autocmd BufNewFile,BufRead *.thor set filetype=ruby
    "autocmd BufNewFile,BufRead *.mk   set filetype=markdown
    "autocmd BufNewFile,BufRead *.md   set filetype=markdown
    "autocmd BufNewFile,BufRead *.mkd  set filetype=markdown
    autocmd BufNewFile,BufRead *.pp   set filetype=puppet syntax=puppet
    autocmd BufNewFile,BufRead *.yaml set filetype=yaml
    autocmd BufNewFile,BufRead *.textile set filetype=textile
    autocmd BufNewFile,BufRead *.pm set filetype=perl
    "autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif    " Default to txt filetype

    " Settings on a per filetype basis
    autocmd FileType lua setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
    autocmd FileType puppet,haml,sass,yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    "autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    "autocmd FileType perl setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd FileType ruby,eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 expandtab
    autocmd FileType coffee setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType textile setlocal wrap

    "ruby
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

    " Don't show tabs in html/xml files
    autocmd filetype html,xml set tabstop=2 softtabstop=2 shiftwidth=2 listchars-=tab:>.

    autocmd filetype c set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

    " Save/load folds when open/closing buffers
    "autocmd BufWinLeave * mkview
    "autocmd BufWinEnter * silent loadview " Removed, doesn't work on writeprotected files

    " Reload settings when changed.
    autocmd! bufwritepost .vimrc source %
    autocmd! bufwritepost */.vim/config/*.vim source %

    " MacVim checks for autoread when it gains focus; terminal Vim
    " must trigger checks. Do so when switching buffers, or after
    " 2 secs (the value of updatetime) of pressing nothing.
    set updatetime=2000
    autocmd WinEnter,BufWinEnter,CursorHold * checktime

endif
