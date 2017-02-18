#!/bin/bash

function _set_capslock_to() {
  # one of (escape swapescape capslock)
  local target=${1}
  set -x
  dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:${target}']"
}
