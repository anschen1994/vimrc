set number

" auto-completion
" nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>

set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1

inoremap <expr> <S-j> pumvisible() ? "\<C-N>" : "<S-j>"
inoremap <expr> <S-k> pumvisible() ? "\<C-P>" : "<S-k>"

" tabs
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
" windows
" just use :sp, there is no way to map <C-->
" nnoremap <C-_> :sp<CR>
nnoremap <C-\> :vsp<CR>

" python config for vim-expand-region
call expand_region#custom_text_objects('python', {
      \ 'af' :1,
      \ 'if' :1,
      \ 'ac' :1,
      \ 'ic' :1,
      \ })

" suppress vim-go warning
let g:go_version_warning = 0
