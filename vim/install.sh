#! /bin/bash

link() {
    ln -s ~/.vim/vimrc ~/.vimrc &< /dev/null

    if [ ! $? -eq 0 ]
    then
        echo "Error: link vimrc failed"
    fi
}

config_vundle() {
    git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle &> /dev/null

    if [ $? -eq 0 ]
    then
        if hash "vim" &> /dev/null
        then
            vim +BundleInstall +qall
        else
            echo "Error: vim command not found"
        fi
    else
        echo "Error: Install vundle failed"
    fi
}

link
config_vundle

if [ $? -eq 0 ]; then 
    echo "Config Vim OK. Enjoy it :-) "
fi

