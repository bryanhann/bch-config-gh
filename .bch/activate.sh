#!/usr/bin/env bash

r=$(dirname $(dirname ${BASH_SOURCE[0]}))

rm -f ~/.config/gh
ln -s ${r}/config.gh ~/.config/gh
export BCH_CONFIG_GH__root=${r}
export BCH_CONFIG_GH__init=${r}/.bch/activate.sh
export BCH_CONFIG_GH__lbin=${r}/.bch/lbin
export BCH_CONFIG_GH__bin=${r}/.bch/bin
export BCH_CONFIG_GH__lib=${r}/.bch/lib

for s in $(ls ${r}/.bch/lbin/bch*); do
     d=${HOME}/.local/bin/$(basename $s)
     [ ! -f ${d} ] && echo "[cookiecutter.dotted] linking ${s}"
     [ ! -f ${d} ] && ln -s ${s} ${d}
done

source ${r}/.bch/init/init.sh

unset r
unset s
unset d
