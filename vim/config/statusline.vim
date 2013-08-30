" Update status line
set noruler                 " Turn off ruler (overridden by statusline anyway)
"set statusline=%F%m%r%h%w\ [LINE=%l\/%L]\ [COL=%c%V]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]
"set statusline=%F%m%r%h%w\ [LINE=%l\/%L]\ [COL=%c%V]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [LEN=%L][POS=\%04l.\%04v]\ )}
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=\%04v.\%04l]\ [LEN=%L]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [\%04v.\%04l/%L]\ [\%03.3b\ \%02.2B]
"set statusline=%F%m%r%h%w\ [%{&ff}]\ [%{fugitive#statusline()}]\ [%Y]\ [\%04v.\%04l/%L]\ [\%03.3b\ \%02.2B]
set laststatus=2            " Last window will always have a statusline
