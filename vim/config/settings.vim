set nocompatible                " Don't use vi compatible mode
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode

" Tabs and indentation defaults
set autoindent                  " Always set autoindenting on
set smartindent
set copyindent                  " Copy the previous indentation on autoindenting
set tabstop=4                   " A tab is four spaces
set shiftwidth=4                " Number of spaces to use for autoindenting
set expandtab                   " TABs become spaces
set nowrap                      " Line wrapping off

" Line numbering
set number                      " Show line numbers
set numberwidth=4               " Use 4 columns for numbers
set cpoptions+=n                " Use number gutter for wrapped lines.
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight clear SignColumn      " Clear background on signcolumn for gitgutter

" Search options
set showmatch                   " Show matching bracket
set hlsearch                    " Highlight results.
set ignorecase smartcase        " Case-insensitive unless we include uppercase.
set incsearch                   " Search-as-you-type.
set nogdefault                  " /g modifier in regexps should work as expected.

" Code handling
set iskeyword=_,$,#,@,%,?
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete
set mouse=a                             " Enable mouse mode (toggle with F12)

set listchars=nbsp:·,tab:▸\ ,trail:·    " Configure how invisibles appear.
set list!                               " Show invisibles.
set scrolloff=3                         " Minimum number of lines to always show above/below the caret.
let &showbreak = '…'                    " Use ellipsis to distinguish soft wrapped lines.

" Allow folding of code
set nofoldenable                        " Don't fold by default
set foldmethod=syntax                   " Fold based on syntax
set foldnestmax=10                      " Deepest fold is 10 levels
set foldlevel=1                         " This is just what i use

" Keep cwd clean
set directory=~/tmp/vim/swap             " Directory for vim swap files
set backupdir=~/tmp/vim/backup,~/tmp/vim " Hide away backup files.

" Window behaviour
set hidden                              " Hide buffers instead of closing.
set winminheight=0                      " Minimum height of inactive window

" Command behaviour
set history=1000                            " Remember more commands and search history
set vb t_vb=                                " Turn off visual bell
set wildignore=*.swp,*.bak,*.pyc,*.class,*~ " Ignore these files in auto-completion
set clipboard=unnamed                       " Yanks go on clipboard instead.
set wildchar=<Tab> wildmenu wildmode=full   " Turn on completion menu.

" Undo persistence
set undofile                                " Save undo's after file closes
set undodir=~/tmp/vim/undo                   " Where to save undo histories
set undolevels=1000                         " How many undos
set undoreload=10000                        " Number of lines to save for undo


" Activate pathogen
call pathogen#infect()

" Improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Syntax highlighting and indentation
syntax enable
filetype plugin on
filetype plugin indent on

" Colorscheme
colorscheme dracula
set background=dark
highlight Comment cterm=italic

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 0

" Encryption
set cryptmethod=blowfish
let g:GPGPreferArmor=1

" Tags
set tags+=./tags

" Reload file without prompting if it has changed on disk.
" Will still prompt if there is unsaved text in the buffer.
set autoread

let g:rspec_command = "!bundle exec rspec {spec}"

" Use ag instead of ack to search, if available.
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" Format Rust code on save
let g:rustfmt_autosave = 1

" airline settings
let g:airline_powerline_fonts = 1
