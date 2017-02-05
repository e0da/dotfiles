#!/bin/bash

target=${1:-escape}

set -x
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:${target}']"
