" ------------------------------------------
" Basic vim
" ------------------------------------------
set number
set noshowmode
set cmdheight=1

" select in popup
inoremap <expr> <S-j> pumvisible() ? "\<C-N>" : "<S-j>"
inoremap <expr> <S-k> pumvisible() ? "\<C-P>" : "<S-k>"

" scroll half screen
nnoremap K <C-u>
nnoremap J <C-d>

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

" run code in vim
autocmd filetype cpp nnoremap <F2> :!g++ -std=c++11 % -Wall -g -o /tmp/%.out && /tmp/%.out<CR>
autocmd filetype python nnoremap <F2> :w <bar> !python % <CR>

" show marks and registers
map <leader>m :marks<cr>
map <leader>r :reg<cr>

" share clipboard with system
set clipboard=unnamedplus

" ------------------------------------------
" YouCompleteMe
" ------------------------------------------
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

" make ycm work with anaconda, related to ~/.vim_runtime/.ycm_extra_conf.py
let g:ycm_python_interpreter_path = '/usr/bin/python'
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \]

" set default filetype as .tmp
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set filetype=tmp | endif
autocmd BufRead,BufNewFile Dockerfile set filetype=Dockerfile

" ------------------------------------------
" vim-expand-region
" ------------------------------------------
" python config
call expand_region#custom_text_objects('python', {
      \ 'af' :1,
      \ 'if' :1,
      \ 'ac' :1,
      \ 'ic' :1,
      \ })

" ------------------------------------------
" vim-go
" ------------------------------------------
" supress warning
let g:go_version_warning = 0


" ------------------------------------------
" PEP8
" ------------------------------------------
" auto run PEP8 check for every save
" autocmd BufWritePost *.py call Flake8()
autocmd FileType python nnoremap <leader>c :call Flake8()<CR>

" F8 to autoformat python code
autocmd FileType python nnoremap <leader>= :call Autopep8()<CR>
" disable show diff window
let g:autopep8_disable_show_diff=1

" ------------------------------------------
" NerdTree
" ------------------------------------------
" close the nerdtree after opening
let NERDTreeQuitOnOpen=1

" ------------------------------------------
" Fzf
" ------------------------------------------
" Rag: dir content
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=+ -complete=dir Hag call fzf#vim#ag_raw(' --hidden '.<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
" map <leader>aa :Ag 
map <leader>aa :Rag<space>
" Consider hidden files
map <leader>ah :Hag<space>
map <leader>ff :Files<cr>
map <leader>fz :Files<space>
" Change working directory to the path of current file
" Use :pwd to check current directory: already have <leader>cd
" map <leader>cc :cd %:h<cr>

" ------------------------------------------
" TagBar
" ------------------------------------------
let g:tagbar_ctags_bin="/root/local_usr/ctags/bin/ctags"
set updatetime=50
let g:tagbar_width=30
let g:tagbar_left=1
map <leader>tt :TagbarToggle<cr>

