let g:syntastic_python_checkers=['pylint']
let g:syntastic_php_checkers=['php']
let g:syntastic_check_on_wq=0
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_highlighting=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'php', 'python', 'coffeescript'],
                           \ 'passive_filetypes': ['puppet'] }
