" ───────────────────────────────────────────────────────────────
" 1.  Make :Files use fd
"     • shows dot-files      ( --hidden )
"     • follows symlinks     ( --follow )
"     • skips the .git dir   ( --exclude .git )
"     •   DOES               respect .gitignore   (we do NOT add --no-ignore-vcs)
" ───────────────────────────────────────────────────────────────
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'

" ───────────────────────────────────────────────────────────────
" 2.  Helper – repo root or current dir if not in a repo
" ───────────────────────────────────────────────────────────────
function! s:project_root() abort
  let l:root = systemlist('git -C . rev-parse --show-toplevel 2>/dev/null')
  return !empty(l:root) ? l:root[0] : getcwd()
endfunction

" ───────────────────────────────────────────────────────────────
" 3.  :ProjectFiles – always opens :Files at the project root
"     Supports :ProjectFiles! (bang) for full-screen fzf
" ───────────────────────────────────────────────────────────────
function! s:project_files(bang) abort
  let l:root = s:project_root()
  execute 'Files' fnameescape(l:root) . (a:bang ? '!' : '')
endfunction
command! -bang ProjectFiles call s:project_files(<bang>0)

" ───────────────────────────────────────────────────────────────
" 4.  Map <C-p>
" ───────────────────────────────────────────────────────────────
nnoremap <silent> <C-p> :ProjectFiles<CR>
