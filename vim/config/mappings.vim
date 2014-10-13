" Map CTRL-[jkhl] to move between splits
" --------------------------------------

" Move to split below
nnoremap <C-j> <C-W>j
" Move to split above
nnoremap <C-k> <C-W>k
" Move to split to the right
nnoremap <C-l> <C-W>l
" Move to split to the left
nnoremap <C-h> <C-W>h
" Quick buffer switching
nnoremap <silent> <Tab> :b#<CR>
" Maximize split
nnoremap <C-m> <C-w>_
" Make splits equal size
nnoremap <Leader>m <C-w>=

" Paste indented code aka the "stairs"
nnoremap <C-P> p=`]
" Clear hilightning
nnoremap <Leader><Space> :noh<CR>
" Create new vertical split and switch to it
nnoremap <Leader>w <C-w>v<C-w>l
" Use space to toggle folds if we are on a fold
"nnoremap <Space> za
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
nnoremap <Leader>h1 yypVr=o
" Markdown header level 2
nnoremap <Leader>h2 yypVr-o
" Markdown header level 3
nnoremap <Leader>h3 I###<Space><Esc>o
" Markdown header level 4
nnoremap <Leader>h4 I####<Space><Esc>o
" Markdown header level 5
nnoremap <Leader>h5 I#####<Space><Esc>o
" Markdown header level 6
nnoremap <Leader>h6 I######<Space><Esc>o
" Markdown horizontal line
nnoremap <Leader>hr o<Space>*<Space>*<Space>*<Return><Esc>
" Make selection bold
vnoremap <Leader>hb xi****<Esc>hP<Esc>
" Make word bold
nnoremap <Leader>hb Bi**<Esc>Ea**<Esc>
" Make selection italics
vnoremap <Leader>hi xi__<Esc>P
" Make word italic
nnoremap <Leader>hi Bi_<Esc>Ea_<Esc>
" Make word code
vnoremap <Leader>hc xi``<Esc>P
" Make selection code
nnoremap <Leader>hc Bi`<Esc>Ea`<Esc>

"
" Refactoring
" -----------

" Format current selection
vnoremap Q gq
" Format current paragraph
nnoremap Q gqap

" Insert spaces around char
nnoremap <Leader>s i<Space><Esc>lli<Space><Esc>b
" Insert single char
nnoremap <Leader>i i_<Esc>r
" Add empty line below line
nnoremap <Leader>o o<Esc>
" Add empty line above line
nnoremap <Leader>O O<Esc>

" Add spaces after commas in current line.
nnoremap <Leader>S :.s/,\([^ ]\)/, \1/<Return>:noh<Return>
" Add spaces after commas in current selection.
vnoremap <Leader>S "*y:'<,'>s/,\([^ ]\)/, \1/<Return>:noh<Return>

" Add spaces around brackets in current line.
nnoremap <Leader>p :.s/\(\S\)(/\1 (/<Return>:.s/)\(\S\)/) \1/<Return>:noh<Return>
" Add spaces around brackets in current selection.
vnoremap <Leader>p "*y:'<,'>s/\(\S\)(/\1 (/<Return>:'<,'>s/)\(\S\)/) \1/<Return>:noh<Return>

" Add spaces inside parentheses.
map <Leader>ss di(i<Space><Space><Esc>P

" Add parenthesis around word
nnoremap <Leader>p Ea)<ESC>Bi(<Esc>
" Add parenthesis around selection.
vnoremap <Leader>p xi()<Esc>P

" Add trailing Semi-colon
nnoremap <Leader>; g_a;<Esc>
" Add trailing comma
nnoremap <Leader>, g_a,<Esc>

" Add " around word. Deprecated, use: csw"
"nnoremap <Leader>" Ea"<ESC>Bi"<ESC>
" Add " around selection.
vnoremap <Leader>" xi""<Esc>P
" Add ' around word. Deprecated, use: csw'
"nnoremap <Leader>' Ea'<ESC>Bi'<ESC>
" Add ' around selection
vnoremap <Leader>' xi''<Esc>P
" Shortcut for surround: cs"'
nnoremap <Leader>' cs"'
" Shortcut for surround: cs'"
nnoremap <Leader>" cs'"

" Replace all occurrances of word under cursor
nnoremap <Leader>f :%s/\<<c-r>=expand("<cword>")<cr>\>/
" Replace latest search with new word
nnoremap <Leader>F :%s//

" Copy line commented with #
nnoremap <Leader>c# yyPi#<Esc>j
" Copy line commented with "
nnoremap <Leader>c" yyPi"<Esc>j
" Copy line commented with //
nnoremap <Leader>c/ yyPi//<Esc>j
" Syntastic check
nnoremap <Leader>l :SyntasticCheck<CR>
" Duplicate line
nnoremap <Leader>d mzYp`z

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Movement, Emacs mappings
" ------------------------

" Move to start of line
nnoremap <C-a> <Home>
" Move to end of line
nnoremap <C-e> <End>
" Yank line
nnoremap <C-y> yy

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
nnoremap <silent> § :NERDTreeToggle<CR>
" BufExplorer
nnoremap <silent> <Leader>§ :BufExplorerHorizontalSplit<CR>

"" CtrlP shortcut
"let g:ctrlp_map = '<A-§>'
"noremap <silent> ¶ :CtrlP<CR>
"" CtrlP command
"let g:ctrlp_cmd = 'CtrlP'
"" Most recently used files on Alt-e
"noremap <silent> é :CtrlPMRU<CR>
"noremap <silent> <Alt-e> :CtrlPMRU<CR>
"" CtrlP select buffer
"noremap <silent> ° :CtrlPBuffer<CR>
"noremap <silent> <Shift-§> :CtrlPBuffer<CR>

" CommandT

" Alt § opens file window
nnoremap <silent> ¶ :CommandT<CR>
nnoremap <silent> <Alt-§> :CommandT<CR>
" Shift § opens buffer window
nnoremap <silent> ° :CommandTBuffer<CR>
nnoremap <silent> <Shift-§> :CommandTBuffer<CR>
" Alt e opens jumplist
nnoremap <silent> é :CommandTJump<CR>
nnoremap <silent> <Alt-e> :CommandTJump<CR>
let g:CommandTMaxHeight = '10'
let g:CommandTMatchWindowReverse = '1'
let g:CommandTCancelMap=['<Esc>', '<C-c>']
let g:CommandTSelectPrevMap=['<Up>', '<C-k>', '<ESC>OA']
let g:CommandTSelectNextMap=['<Down>', '<C-j>', '<ESC>OB']

" Update tag list
nnoremap † :!ctags -R --exclude=.git --exclude=logs --exclude=doc --exclude=tmp .<CR>

" RSpec.vim mappings
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>


" Remap VIM 0 to first non-blank character
nnoremap 0 ^
