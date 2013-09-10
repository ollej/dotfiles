" Map CTRL-[jkhl] to move between splits
" --------------------------------------

" Move to split below
nnoremap <C-j> <C-W>j<C-W>_
" Move to split above
nnoremap <C-k> <C-W>k<C-W>_
" Move to split to the right
nnoremap <C-l> <C-W>l
" Move to split to the left
nnoremap <C-h> <C-W>h
" Quick buffer switching
noremap <silent> <Tab> :b#<CR>

" Paste indented code aka the "stairs"
nnoremap <C-P> p=`]
" Clear hilightning
nnoremap <Leader><Space> :noh<CR>
" Create new vertical split and switch to it
nnoremap <Leader>w <C-w>v<C-w>l
" Use space to toggle folds if we are on a fold
nnoremap <Space> za
" Hide line numbers with C-N C-N
nmap <C-N><C-N> :set invnumber<CR>

" Use perl regexp syntax when searching
nnoremap / /\v
vnoremap / /\v

" j/k goes to next editor row instead of next line in file.
nnoremap j gj
nnoremap k gk

" Use two exclamation points to save file using sudo
cmap w!! w !sudo tee % >/dev/null

"" vimux mappings
"" --------------

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

"
" Markdown syntax mappings
" ------------------------

" Markdown header level 1
map <Leader>h1 yypVr=o
" Markdown header level 2
map <Leader>h2 yypVr-o
" Markdown header level 3
map <Leader>h3 I###<Space><Esc>o
" Markdown header level 4
map <Leader>h4 I####<Space><Esc>o
" Markdown header level 5
map <Leader>h5 I#####<Space><Esc>o
" Markdown header level 6
map <Leader>h6 I######<Space><Esc>o
" Markdown horizontal line
map <Leader>hr o<Space>*<Space>*<Space>*<Return><Esc>
" Make selection bold
vmap <Leader>hb xi****<Esc>hP<Esc>
" Make word bold
nmap <Leader>hb Bi**<Esc>Ea**<Esc>
" Make selection italics
vmap <Leader>hi xi__<Esc>P
" Make word italic
nmap <Leader>hi Bi_<Esc>Ea_<Esc>
" Make word code
vmap <Leader>hc xi``<Esc>P
" Make selection code
nmap <Leader>hc Bi`<Esc>Ea`<Esc>

"
" Refactoring
" -----------

" Format current selection
vmap Q gq
" Format current paragraph
nmap Q gqap

" Insert spaces around char
nmap <Leader>s i<Space><Esc>lli<Space><Esc>b
" Insert single char
nmap <Leader>i i_<Esc>r
" Add empty line below line
nmap <Leader>o o<Esc>
" Add empty line above line
nmap <Leader>O O<Esc>

" Add spaces after commas in current line.
nmap <Leader>S :.s/,\([^ ]\)/, \1/<Return>:noh<Return>
" Add spaces after commas in current selection.
vmap <Leader>S "*y:'<,'>s/,\([^ ]\)/, \1/<Return>:noh<Return>

" Add spaces around brackets in current line.
nmap <Leader>p :.s/\(\S\)(/\1 (/<Return>:.s/)\(\S\)/) \1/<Return>:noh<Return>
" Add spaces around brackets in current selection.
vmap <Leader>p "*y:'<,'>s/\(\S\)(/\1 (/<Return>:'<,'>s/)\(\S\)/) \1/<Return>:noh<Return>

" Add parenthesis around word
nmap <Leader>p Ea)<ESC>Bi(<Esc>
" Add parenthesis around selection.
vmap <Leader>p xi()<Esc>P

" Add " around word
nmap <Leader>" Ea"<ESC>Bi"<ESC>
" Add " around selection
vmap <Leader>" xi""<Esc>P
" Add ' around word
nmap <Leader>' Ea'<ESC>Bi'<ESC>
" Add ' around selection
vmap <Leader>' xi''<Esc>P

" Replace all occurrances of word under cursor
nmap <Leader>f :%s/\<<c-r>=expand("<cword>")<cr>\>/
" Replace latest search with new word
nmap <Leader>F :%s//

" Copy line commented with #
noremap <Leader>c# yyPi#<Esc>j
" Copy line commented with "
noremap <Leader>c "yyPi"<Esc>j
" Copy line commented with //
noremap <Leader>c/ yyPi//<Esc>j
" Syntastic check
noremap <Leader>l :SyntasticCheck<CR>
" Duplicate line
noremap <Leader>d mzYp`z

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Movement, Emacs mappings
" ------------------------

" Move to start of line
noremap <C-a> <Home>
" Move to end of line
noremap <C-e> <End>
" Yank line
noremap <C-y> yy

" File exploration
" ----------------

"" Shift § opens Fuzzy File Finder
"noremap <silent> ° :FufFile<CR>
"" Alt § opens Fuzzy Tag Finder
"noremap <silent> ¶ :FufTag<CR>
"" Alt e opens Fuzzy Buffer Finder
"noremap <silent> é :FufBuffer<CR>
"
" Toggle NERD_tree
noremap <silent> § :NERDTreeToggle<CR>
" BufExplorer
noremap <silent> <Leader>§ :BufExplorerHorizontalSplit<CR>

" CtrlP shortcut
let g:ctrlp_map = '<A-§>'
noremap <silent> ¶ :CtrlP<CR>
" CtrlP command
let g:ctrlp_cmd = 'CtrlP'
" Most recently used files on Alt-e
noremap <silent> é :CtrlPMRU<CR>
noremap <silent> <Alt-e> :CtrlPMRU<CR>
" CtrlP select buffer
noremap <silent> ° :CtrlPBuffer<CR>
noremap <silent> <Shift-§> :CtrlPBuffer<CR>
" Update tag list
noremap † :!ctags -R --exclude=.git --exclude=logs --exclude=doc --exclude=tmp .<CR>


" Remap VIM 0 to first non-blank character
noremap 0 ^
