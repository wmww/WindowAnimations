#!/bin/bash
i=1
j=0
while test $j -lt 5; do
  name="$(printf "render_png/img%04d.png" $i)"
  if test -e "$name"; then
    echo "$name exists"
    j=0
  elif test -L "$name"; then
    echo "$name was a broken symlink"
    rm "$name"
  else
    echo "$name does not exist"
    ln -s "$(printf "img%04d.png" $((i-1)))" "$name"
    j=$((j+1))
  fi
  i=$((i+1))
done
