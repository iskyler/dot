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
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        if [ ! $? -eq 0 ]
        then
            echo "Error: Install vundle failed"
            exit -1
        fi
    fi

    echo "Vundle install ok"
    hash vim 2>/dev/null || { \
        echo "vim command not found"; exit -1; }
    vim --not-a-term +PluginInstall +qall
    git clone https://github.com/Valloric/YouCompleteMe ~/.vim/bundle/YouCompleteMe
    cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.py --clang-completer --go-completer
}

link
config_vundle

if [ $? -eq 0 ]; then 
    echo "Config Vim OK. Enjoy it :-) "
fi

