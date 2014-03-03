#! /bin/bash

link() {
    if [ -f "~/.vimrc" ]
    then
        var date = `date "+%Y-%m-%d-%H-%M-%S"`
        mv ~/.vimrc ~/.vimrc-$date
    fi
    ln -s ~/.vim/vimrc ~/.vimrc &< /dev/null

    echo $?
    if [ ! $? -eq 0 ]
    then
        echo "Error: link vimrc failed"
        exit -1
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
            exit -1
        fi
    else
        echo "Error: Install vundle failed"
        exit -1
    fi
}

link
config_vundle

if [ $? -eq 0 ]; then 
    echo "Config Vim OK. Enjoy it :-) "
fi

