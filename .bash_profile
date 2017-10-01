#!/usr/bin/env bash
#
# .bash_profile
#
# Read and executed by bash(1), when it is beeing started as login shell. Read
# after /etc/profile.

[[ -f $HOME/.bash_login ]] &&
    . "$HOME/".bash_login;

[[ -f $HOME/.bashrc ]] &&
    . "$HOME/".bashrc;

#export BASH_ENV=.bashenv

# vim: set ts=4 sw=4 tw=0 et :
