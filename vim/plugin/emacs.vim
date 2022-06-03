" Silly plugin to eval elisp in emacs

" Run range as shell script
command! -range -nargs=1 SendToCommand <line1>,<line2>call SendToCommand(<q-args>) 
function! SendToCommand(UserCommand) range
    let SelectedLines = getline(a:firstline,a:lastline)
    let ScriptInput = join(SelectedLines, "\n") . "\n"
    let result = system(a:UserCommand, ScriptInput)
    echo result
endfunction

" Evaluate elisp in Emacs
"command! -range=% Emacs !/usr/bin/emacsclient -n -e 
"command -range=% Emacs SendToCommand("emacsclient -e")
"command! -range Emacs <line1>,<line2>call SendToCommand("emacsclient -e")

" (info "help")
" (info "(emacs) Saving Emacs Sessions")
" (message 'hi')

