#!/bin/sh
set -e

cd ~/.vim_runtime/my_plugins/YouCompleteMe
python3 install.py --clang-completer

cd ~/.vim_runtime

git remote set-url origin https://github.com/meltycriss/vimrc.git

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

echo '
# for vim plugin: vim-multiple-cursors
stty -ixon' >> ~/.bashrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
