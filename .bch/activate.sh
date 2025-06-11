#!/usr/bin/env bash

r=$(dirname $(dirname ${BASH_SOURCE[0]}))

[   -L ~/.config/gh ] && rm -f ~/.config/gh
[   -d ~/.config/gh ] && bch:000:note "already exists: ~/.config/gh"
[ ! -d ~/.config/gh ] && ln ${r}/config.gh ~/.config/gh

export BCH_CONFIG_GH__root=${r}
export BCH_CONFIG_GH__init=${r}/.bch/activate.sh
export BCH_CONFIG_GH__lbin=${r}/.bch/lbin
export BCH_CONFIG_GH__bin=${r}/.bch/bin
export BCH_CONFIG_GH__lib=${r}/.bch/lib

source ${r}/.bch/init/fn.sh
source ${r}/.bch/init/init.sh

::lbin:: ${r}/.bch/lbin

unset r
