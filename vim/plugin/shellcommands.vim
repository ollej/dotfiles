" Run shell command (use vimux instead)
function! RunCmd(cmd)
  let fn = expand("%:p")
  let ft = &l:filetype
  botright copen
  setlocal modifiable
  %d _
  silent execute "read !".a:cmd." ".fn
  1d _
  normal! 0
  if ft != ""
	execute "setf ".ft
  else
	setlocal filetype=
  endif
  setlocal nomodifiable nomodified
  wincmd p
endfunction

command! -nargs=1 Run     call RunCmd(<q-args>)
command!          RunPerl call RunCmd("/usr/bin/perl")



