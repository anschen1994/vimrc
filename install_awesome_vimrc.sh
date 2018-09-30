#!/bin/sh
set -e

cd ~/.vim_runtime/my_plugins/YouCompleteMe

# with semantic support for C-family languages
# manually download the libclang if the script gets stuck
mkdir ~/.vim_runtime/my_plugins/YouCompleteMe/third_party/ycmd/clang_archives
cp ~/.vim_runtime/utils/libclang-6.0.0-x86_64-linux-gnu-ubuntu-14.04.tar.bz2 ~/.vim_runtime/my_plugins/YouCompleteMe/third_party/ycmd/clang_archives/
python3 install.py --clang-completer

# without semantic support for C-family languages
# python3 install.py

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

echo '
[flake8]
max-line-length = 120
' >> ~/.config/flake8

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
