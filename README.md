These are my personal configuration files. The directory structure is designed
so that you can symlink everything with a single command.

## Cloning ##

    git clone https://github.com/justinforce/dotfiles --recursive

## Installing ##

Usually, you just want to

    cd dotfiles
    ./setup.rb -vf

Optionally, add a role name (such as harold, home, etc.) to install
role-specific configuration. Run `./setup.rb -h` for all the options.

    ./setup.rb harold

## Layout ##

* The config files are in the `files` directory.
* The installation tasks are in `config.yml`.

## Updating ##

    cd dotfiles
    ./update.sh

## Copyright ##

Copyright (c) 2012, Justin Force

Licensed under the [MIT License](http://www.opensource.org/licenses/mit-license.html)
