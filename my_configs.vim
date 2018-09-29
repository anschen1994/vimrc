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

" default conf for c-family code
let g:ycm_global_ycm_extra_conf = '~/.vim_runtime/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/.vim_runtime/.ycm_extra_conf.py']

inoremap <expr> <S-j> pumvisible() ? "\<C-N>" : "<S-j>"
inoremap <expr> <S-k> pumvisible() ? "\<C-P>" : "<S-k>"

" tabs
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>

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

" run c++ code
nnoremap <C-r> :!g++ -std=c++11 % -Wall -g -o /tmp/%.out && /tmp/%.out<CR>

" show marks and registers
map <leader>m :marks<cr>
map <leader>r :reg<cr>
