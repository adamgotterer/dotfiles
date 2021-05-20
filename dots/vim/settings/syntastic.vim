set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_ruby_rubocop_args='--display-cop-names'

let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height = 2
let g:syntastic_enable_signs = 1

let g:syntastic_error_symbol = '🚫'
let g:syntastic_style_error_symbol = '🚫'
let g:syntastic_warning_symbol = '🔔'
let g:syntastic_style_warning_symbol = '🔔'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
