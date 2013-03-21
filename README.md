These are my personal configuration files. The directory structure is designed
so that you can symlink everything with a single command.

## Cloning ##

    git clone https://github.com/justinforce/dotfiles --recursive

## Installing ##

Usually, you just want to

    cd dotfiles
    rake install

By default, existing files aren't overwritten. You can force installation with

    rake force

## Updating ##

    cd dotfiles
    rake update

## Copyright ##

Copyright (c) 2012, Justin Force

Licensed under the [MIT License](http://www.opensource.org/licenses/mit-license.html)
dotvim
======

This is my vim configuration. I use [Vundle][] to manage plugins.

Installation
------------

```sh
git clone https://github.com/justinforce/dotvim ~/.vim && ~/.vim/install_vundle && ln -s ~/.vim/vimrc ~/.vimrc
```

License
-------

[MIT license](http://www.opensource.org/licenses/MIT)

[Vundle]:https://github.com/gmarik/vundle
