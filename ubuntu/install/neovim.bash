#!/bin/bash

set -x

###############################################################################
# Retrieved from https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu
# on 04/22/16
###############################################################################

sudo apt install --yes software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install --yes neovim
sudo apt install --yes python-dev python-pip python3-dev python3-pip
sudo pip install neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
