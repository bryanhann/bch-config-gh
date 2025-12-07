#!/usr/bin/env bash

. $(dirname $BASH_SOURCE)/bash_colors.sh

::warn:: ()
{
    clr_reverse "[:warn:] $@ "
}

::dbg:: () {
    [ -f ~/DEBUG ] && echo [:dbg:] $@
}

::ln:: () {
    local real=$1
    local link=$2
    [ -L $link ] && rm -f $link
    [ -d $line ] && ::warn:: "already exists! $link"
    [ -d $line ] && return
    ln -s $real $link
}

::lbin:: () {
    local real
    local link
    for real in $(ls $1/bch.*); do
        link=~/.local/bin/$(basename $real)
        [   -f ${link} ] && ::dbg:: [:lbin:] found $link
        [   -f ${link} ] && continue
        [ ! -f ${link} ] && ::dbg:: [:lbin:] create $link
        [ ! -f ${link} ] && ln -s $real $link
    done
}
