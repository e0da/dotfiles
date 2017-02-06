#!/bin/bash

set -x

patch /etc/init/lightdm.conf lightdm.conf.patch
