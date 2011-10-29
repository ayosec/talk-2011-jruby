#!/bin/sh

set -e

for dotfile in *.dot
do
  dest=${dotfile%%.dot}.png
  if test \! -e $dest || test $dotfile -nt $dest
  then
    echo "$dotfile > $dest"
    dot -Tpng -o $dest $dotfile
  fi
done
