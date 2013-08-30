" Map CTRL-[jkhl] to move between splits
nnoremap <C-j> <C-W>j<C-W>_         " Move to split below
nnoremap <C-k> <C-W>k<C-W>_         " Move to split above
nnoremap <C-l> <C-W>l               " Move to split to the right
nnoremap <C-h> <C-W>h               " Move to split to the left
noremap <silent> <Tab> :b#<CR>      " Quick buffer switching

nnoremap <C-P> p=`]                 " Paste indented code aka the "stairs"
nnoremap <Leader><Space> :noh<CR>   " Clear hilightning
nnoremap <Leader>w <C-w>v<C-w>l     " Create new vertical split and switch to it
nnoremap <Space> za                 " Use space to toggle folds if we are on a fold
nmap <C-N><C-N> :set invnumber<CR>  " Hide line numbers with C-N C-N

" Use perl regexp syntax when searching
nnoremap / /\v
vnoremap / /\v

" j/k goes to next editor row instead of next line in file.
nnoremap j gj
nnoremap k gk

" Use two exclamation points to save file using sudo
cmap w!! w !sudo tee % >/dev/null

"" vimux mappings
"" Prompt for a command to run 
"map <Leader>vp :VimuxPromptCommand<CR>
"
"" Run last command executed by VimuxRunCommand
"map <Leader>vl :VimuxRunLastCommand<CR>
"
"" Inspect runner pane
"map <Leader>vi :VimuxInspectRunner<CR>
"
"" Close vim tmux runner opened by VimuxRunCommand
"map <Leader>vq :VimuxCloseRunner<CR>
"
"" Close all other tmux panes in current window
"map <Leader>vx :VimuxClosePanes<CR>
"
"" Clear the tmux history of the runner pane
"map <Leader>vc :VimuxClearRunnerHistory<CR>
"
"" If text is selected, save it in the v buffer and send that buffer it to tmux
"vmap <LocalLeader>vs "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
"
"" Select current paragraph and send it to tmux
"nmap <LocalLeader>vs vip<LocalLeader>vs<CR>

" Markdown syntax mappings
map <Leader>h1 yypVr=o                      " Markdown header level 1
map <Leader>h2 yypVr-o                      " Markdown header level 2
map <Leader>h3 I###<Space><Esc>o            " Markdown header level 3
map <Leader>h4 I####<Space><Esc>o           " Markdown header level 4
map <Leader>h5 I#####<Space><Esc>o          " Markdown header level 5
map <Leader>h6 I######<Space><Esc>o         " Markdown header level 6
map <Leader>hr o<Space>*<Space>*<Space>*<Return><Esc>   " Markdown horizontal line
vmap <Leader>hb xi****<Esc>hP<Esc>          " Make selection bold
nmap <Leader>hb Bi**<Esc>Ea**<Esc>          " Make word bold
vmap <Leader>hi xi__<Esc>P                  " Make selection italics
nmap <Leader>hi Bi_<Esc>Ea_<Esc>            " Make word italic
vmap <Leader>hc xi``<Esc>P                  " Make word code
nmap <Leader>hc Bi`<Esc>Ea`<Esc>            " Make selection code

" Refactoring
vmap Q gq                           " Format current selection
nmap Q gqap                         " Format current paragraph

nmap <Leader>s i<Space><Esc>lli<Space><Esc>b    " Insert spaces around char
nmap <Leader>i i_<Esc>r                         " Insert single char
nmap <Leader>o o<Esc>                           " Add empty line below line
nmap <Leader>O O<Esc>                           " Add empty line above line

nmap <Leader>S :.s/,\([^ ]\)/, \1/<Return>:noh<Return>          " Add spaces after commas in current line.
vmap <Leader>S "*y:'<,'>s/,\([^ ]\)/, \1/<Return>:noh<Return>   " Add spaces after commas in current selection.

nmap <Leader>p :.s/\(\S\)(/\1 (/<Return>:.s/)\(\S\)/) \1/<Return>:noh<Return>               " Add spaces around brackets in current line.
vmap <Leader>p "*y:'<,'>s/\(\S\)(/\1 (/<Return>:'<,'>s/)\(\S\)/) \1/<Return>:noh<Return>    " Add spaces around brackets in current selection.

nmap <Leader>p Ea)<ESC>Bi(<Esc>             " Add parenthesis around word
vmap <Leader>p xi()<Esc>P                   " Add parenthesis around selection.

nmap <Leader>f :%s/\<<c-r>=expand("<cword>")<cr>\>/     " Replace all occurrances of word under cursor
nmap <Leader>F :%s//                        " Replace latest search with new word

noremap <Leader>c# yyPi#<Esc>j              " Copy line commented with #
noremap <Leader>c" yyPi"<Esc>j              " Copy line commented with "
noremap <Leader>c/ yyPi//<Esc>j             " Copy line commented with //
noremap <Leader>l :SyntasticCheck<CR>       " Syntastic check
noremap <Leader>d mzYp`z                    " Duplicate line

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Movement, Emacs mappings
noremap <C-a> <Home>                        " Move to start of line
noremap <C-e> <End>                         " Move to end of line
noremap <C-y> yy                            " Yank line

" File exploration
noremap <silent> ° :FufFile<CR>             " Shift § opens Fuzzy File Finder
noremap <silent> ¶ :FufTag<CR>              " Alt § opens Fuzzy Tag Finder
noremap <silent> é :FufBuffer<CR>           " Alt e opens Fuzzy Buffer Finder
noremap <silent> § :NERDTreeToggle<CR>      " Toggle NERD_tree
noremap <silent> <Leader>§ :BufExplorerHorizontalSplit<CR>  " BufExplorer

" Remap VIM 0 to first non-blank character
noremap 0 ^
