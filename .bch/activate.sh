#!/usr/bin/env bash

r=$(dirname $(dirname ${BASH_SOURCE[0]}))

export BCH_CONFIG_GH__root=${r}
export BCH_CONFIG_GH__init=${r}/.bch/activate.sh
export BCH_CONFIG_GH__lbin=${r}/.bch/lbin
export BCH_CONFIG_GH__bin=${r}/.bch/bin
export BCH_CONFIG_GH__lib=${r}/.bch/lib

source $(dirname $BASH_SOURCE)/init/fn.sh
::ln:: ${r}/config.gh ~/.config/gh
::lbin:: ${r}/.bch/lbin
source ${r}/.bch/init/init.sh

unset r
