#!/bin/sh

git clone --recurse-submodules https://github.com/LKI/myconf.git ~/.myconf
DIR="~/.myconf"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

function bak {
    if [ -e $1 ]
    then
        mv $1 $1.bak
    fi
}

# Install dotvim
bak .vimrc
bak .vim
ln -sf $DIR/dotvim/vimrc ~/.vimrc
ln -sf $DIR/dotvim ~/.vim

# Install .emacs.d
# bak .emacs.d
# ln -s $DIR/emacs.d ~/.emacs.d

# Install .gitconfig
ln -sf $DIR/.gitconfig ~/.gitconfig

# Install .tmux.conf
ln -sf $DIR/.tmux.conf ~/.tmux.conf

echo "Setup success."