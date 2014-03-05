#!/usr/bin/env bash

find . -name \.DS_Store -type f -delete
unamestr=`uname -s`

if [ "$unamestr" == "Darwin" ]; then 
  echo "Check homebrew..."
  which brew > /dev/null
  if [ "$?" != "0" ]; then
    echo "Oops... 'brew' was not found, install it now"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  else
    echo "Ok"
  fi

  echo "Check stow..."
  which stow > /dev/null
  if [ "$?" != "0" ]; then
    echo "Oops... 'stow' was not found, install it now"
    brew install stow
  fi

  echo "Check mercurial..."
  which hg > /dev/null
  if [ "$?" != "0" ]; then
    echo "Oops... 'hg' was not found, install it now"
    brew install mercurial
  fi
else
  echo "TODO: Add ubuntu checker"
fi

for dir in */; do
  if [ -d "$dir" ]; then
    echo "Install ${dir}"
    stow -t ~ $dir
  fi
done

if [ ! -d ~/.oh-my-zsh ]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

if [ ! -d ~/.ve ]; then
  mkdir ~/.ve
fi

if [ ! -d ~/.commshots ]; then
  mkdir ~/.commshots
fi
