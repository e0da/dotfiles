#!/bin/bash

echo "Fix found at https://github.com/rbenv/ruby-build/issues/1092#issuecomment-309771349"

set -ex

which gcc-5 || yaourt -S gcc5
CC=/usr/bin/gcc-5 PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig rbenv install 2.3.1
