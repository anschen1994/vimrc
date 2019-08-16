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

" enable file path completion for any file type
let g:ycm_filepath_blacklist = {}
" set default filetype as .tmp
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set filetype=tmp | endif

inoremap <expr> <S-j> pumvisible() ? "\<C-N>" : "<S-j>"
inoremap <expr> <S-k> pumvisible() ? "\<C-P>" : "<S-k>"

" tabs
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>
" Escaped sequence of <A-h> and <A-l>
nnoremap <ESC>h :tabmove -1<CR>
nnoremap <ESC>l :tabmove +1<CR>

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

" run code in vim
autocmd filetype cpp nnoremap <F2> :!g++ -std=c++11 % -Wall -g -o /tmp/%.out && /tmp/%.out<CR>
autocmd filetype python nnoremap <F2> :w <bar> !python % <CR>

" show marks and registers
map <leader>m :marks<cr>
map <leader>r :reg<cr>

" share clipboard with system
set clipboard=unnamedplus

" auto run PEP8 check for every save
" autocmd BufWritePost *.py call Flake8()
autocmd FileType python nnoremap <leader>c :call Flake8()<CR>

" F8 to autoformat python code
autocmd FileType python nnoremap <leader>= :call Autopep8()<CR>
" disable show diff window
let g:autopep8_disable_show_diff=1
" make ycm work with anaconda, related to ~/.vim_runtime/.ycm_extra_conf.py
let g:ycm_python_interpreter_path = '/data/linjuntong/anaconda3/envs/py36/bin/python'
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \]

" scroll half screen
nnoremap K <C-u>
nnoremap J <C-d>

" close the nerdtree after opening
let NERDTreeQuitOnOpen=1

" " Or, you could use neovim's virtual virtual text feature.
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'virtual'

" Make complete parameter compatible with auto-pair
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>

inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
" let g:complete_parameter_log_level = 1
" set cmdheight=3

" Rag: dir content
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

