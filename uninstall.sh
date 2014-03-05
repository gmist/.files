#!/usr/bin/env bash

find . -name \.DS_Store -type f -delete

for dir in */; do
  if [ -d "$dir" ]; then
    echo "Unistall ${dir}"
    stow -D -t ~ $dir
  fi
done
