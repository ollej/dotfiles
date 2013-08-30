if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " local filetype changes go here
  au BufRead,BufNewFile COMMIT_EDITMSG      setf git 
  au BufRead,BufNewFile *.coffee            setl shiftwidth=2 expandtab
augroup END
