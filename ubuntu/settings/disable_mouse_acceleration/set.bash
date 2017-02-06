#!/bin/bash

source common.bash

install -m 0755 "$SCRIPT" "$BIN"
install -m 0644 "$SHORTCUT" "$AUTOSTART"
