.PHONY: init vim
init: vim oh-my-zsh

vim:
	`pwd`/vim-setup.sh

oh-my-zsh:
	[ -d ~/.oh-my-zsh/.git ] || \
		git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

zsh: oh-my-zsh
	ln -fs `pwd`/zsh/zshrc ~/.zshrc
