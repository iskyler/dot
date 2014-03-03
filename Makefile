.PHONY: init vim
init: vim

vim:
	cp -a vim ~/.vim	
	~/.vim/install.sh
