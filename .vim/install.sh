#! /bin/bash

link() {
    ln -s ~/.vim/vimrc ~/.vimrc &< /dev/null

    if [ ! $? -eq 0 ]
    then
        echo "Error: link vimrc failed"
    fi
}

config_vundle() {
    if [ ! -d "~/.vim/bundle/vundle"]
    then
        git clone git://github.com/gmarik/vundle.git &> /dev/null
    fi

    if [ $? -eq 0 ]
    then
        if hash "vim" &> /dev/null
        then
            vim +BundleInstall +qall
        else
            echo "Error: vim command not found"
    else
        echo "Error: Install vundle failed"
    fi
}

link
config_vundle
