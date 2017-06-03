#! /bin/bash

echo $'#############################
###    Vim Config Start   ###
#############################'
link() {
    CUR_TIME=`date "+%Y-%m-%d-%H-%M-%S"`
    if [ -d ~/.vim ]
    then 
        mv ~/.vim ~/.vim-${CUR_TIME}     
        echo "move ~/.vim to ~/.vim-${CUR_TIME}"
    fi
    cp -a ./vim ~/.vim

    if [ -f ~/.vimrc ]
    then
        mv ~/.vimrc ~/.vimrc-${CUR_TIME}
        echo "move ~/.vimrc to ~/.vimrc-${CUR_TIME}"
    fi
    ln -s ~/.vim/vimrc ~/.vimrc &> /dev/null

    if [ ! $? -eq 0 ]
    then
        echo "Error: link vimrc failed"
        exit -1
    fi
}

config_vundle() {
    if [ ! -d ~/.vim/bundle ]
    then
        mkdir -p ~/.vim/bundle
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        if [ ! $? -eq 0 ]
        then
            echo "Error: Install vundle failed"
            exit -1
        fi
    fi

    echo "Vundle install ok"
    hash vim 2>/dev/null || { \
        echo "vim command not found"; exit -1; }
    vim -E +BundleInstall +qall
}

link
config_vundle

if [ $? -eq 0 ]; then 
    echo "Config Vim OK. Enjoy it :-) "
fi

