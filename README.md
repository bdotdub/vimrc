vimrc
=====

Installation
------------

First, install [vim-plug](https://github.com/junegunn/vim-plug):

```
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Link your `vimrc`:

    ln -s vimrc ~/.vimrc

Then, run vim and type in:

    :PlugInstall
