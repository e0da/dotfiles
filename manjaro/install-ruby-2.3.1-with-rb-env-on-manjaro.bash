#!/bin/bash

# https://github.com/rbenv/ruby-build/issues/1092#issuecomment-309771349

CC=/usr/bin/gcc-5 PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig rbenv install 2.3.1
