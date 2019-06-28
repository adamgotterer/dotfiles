call plug#begin('~/.vim/plugged')

set rtp+=~/.vim/plugged/

runtime appearance.plug
runtime javascript.plug
runtime programming.plug
runtime ruby.plug
runtime textobjects.plug
runtime git.plug
runtime languages.plug
runtime python.plug
runtime search.plug
runtime vim-improvements.plug
runtime editing.plug

call plug#end()
