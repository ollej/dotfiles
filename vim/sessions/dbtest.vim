let SessionLoad = 1
if &cp | set nocp | endif
nnoremap  h
let s:cpo_save=&cpo
set cpo&vim
nnoremap <NL> j_
nnoremap  k_
nnoremap  l
nnoremap  p=`]
nnoremap   za
vmap ,p "*y:'<,'>s/\(\S\)(/\1 (/:'<,'>s/)\(\S\)/) \1/:noh
nmap ,p :.s/\(\S\)(/\1 (/:.s/)\(\S\)/) \1/:noh
vmap ,S "*y:'<,'>s/,\([^ ]\)/, \1/:noh
nmap ,S :.s/,\([^ ]\)/, \1/:noh
nmap ,O O
nmap ,o o
nmap ,i i_r
nmap ,s i lli b
map ,h2 yypVr-o
map ,h1 yypVr=o
map ,vc :VimuxClearRunnerHistory
map ,vx :VimuxClosePanes
map ,vq :VimuxCloseRunner
map ,vi :VimuxInspectRunner
map ,vl :VimuxRunLastCommand
map ,vp :VimuxPromptCommand
nnoremap ,w vl
nnoremap ,  :noh
nmap Q gqap
vmap Q gq
nmap \vs vip\vs
vmap \vs "vy :call VimuxRunCommand(@v . "\n", 0)
nmap gx <Plug>NetrwBrowseX
nnoremap j gj
nnoremap k gk
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
cmap w!! w !sudo tee % >/dev/null
iabbr lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
iabbr mit By Olle Johansson <http://ollej.mit-license.org> =strftime("%F") under the MIT license.
iabbr ddate =strftime("%F")
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=~/.vim/backup
set clipboard=autoselect,exclude:cons\\|linux,unnamed
set completeopt=longest,menuone
set copyindent
set directory=~/.vim/swap
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set gdefault
set helplang=en
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~,=,:
set iskeyword=_,$,#,@,%
set laststatus=2
set listchars=nbsp:·,tab:▸\ ,trail:·
set mouse=a
set omnifunc=syntaxcomplete#Complete
set printoptions=paper:letter
set runtimepath=~/.vim,~/.vim/bundle/cvim,~/.vim/bundle/puppet,~/.vim/bundle/vim-markdown,~/.vim/bundle/vim-rails,~/.vim/bundle/vim-ruby,~/.vim/bundle/vimux,~/.vim/bundle/vimux-pyutils,~/.vim/bundle/web-indent,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/bundle/puppet/after,~/.vim/after
set scrolloff=3
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04v.%04l]\ [LEN=%L]\ [ASCII=%03.3b]\ [HEX=%02.2B]
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=4
set undodir=~/.vim/undo
set undofile
set updatetime=2000
set visualbell
set wildignore=*.swp,*.bak,*.pyc,*.class
set winminheight=0
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dev/rf-git/dbtest
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +29 bin/main.pl
badd +1 lib/Database/SQLite.pm
badd +26 lib/Database.pm
badd +87 lib/ConnectionFactory.pm
badd +1 lib/Demonizer.pm
args bin/main.pl lib/Database/SQLite.pm
edit lib/ConnectionFactory.pm
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 118 + 118) / 236)
exe 'vert 2resize ' . ((&columns * 117 + 118) / 236)
argglobal
2argu
edit lib/ConnectionFactory.pm
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=1
setlocal foldlevel=1
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
set foldnestmax=10
setlocal foldnestmax=10
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=_,$,#,@,%
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=syntaxcomplete#Complete
setlocal path=~/perl5/perlbrew/perls/perl-5.12.4/lib/site_perl/5.12.4/x86_64-linux,~/perl5/perlbrew/perls/perl-5.12.4/lib/site_perl/5.12.4,~/perl5/perlbrew/perls/perl-5.12.4/lib/5.12.4/x86_64-linux,~/perl5/perlbrew/perls/perl-5.12.4/lib/5.12.4,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 81 - ((26 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
81
normal! 0
wincmd w
argglobal
2argu
edit lib/Database.pm
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=1
setlocal foldlevel=1
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
set foldnestmax=10
setlocal foldnestmax=10
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=_,$,#,@,%
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=syntaxcomplete#Complete
setlocal path=~/perl5/perlbrew/perls/perl-5.12.4/lib/site_perl/5.12.4/x86_64-linux,~/perl5/perlbrew/perls/perl-5.12.4/lib/site_perl/5.12.4,~/perl5/perlbrew/perls/perl-5.12.4/lib/5.12.4/x86_64-linux,~/perl5/perlbrew/perls/perl-5.12.4/lib/5.12.4,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 52 - ((38 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
52
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 118 + 118) / 236)
exe 'vert 2resize ' . ((&columns * 117 + 118) / 236)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
