#!/usr/bin/env bash

find . -name \.DS_Store -type f -delete
unamestr=`uname -s`

if [ "$unamestr" == "Darwin" ]; then 
  echo "Check homebrew..."
  which brew > /dev/null
  if [ "$?" != "0" ]; then
    echo "Oops... 'brew' was not found, install it now"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
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

  echo "Check pip..."
  which pip > /dev/null
  if [ "$?" != "0" ]; then
    echo "Oops... 'pip' was not found, install it now"
    sudo easy_install pip
  fi

  echo "Check virtualenvwrapper..."
  which virtualenvwrapper > /dev/null
  if [ "$?" != "0" ]; then
    echo "Oops... 'virtualenvwrapper' was not found, install it now"
    sudo pip install virtualenvwrapper
  fi
  
else
  echo "TODO: Add ubuntu checker"
fi

git clone https://github.com/gmist/.files.git

cd .files
for dir in */; do
  if [ -d "$dir" ]; then
    echo "Install ${dir}"
    stow -t ~ $dir
  fi
done

cd ~
if [ ! -d ~/.oh-my-zsh ]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

if [ ! -d ~/.ve ]; then
  mkdir ~/.ve
fi

if [ ! -d ~/.commshots ]; then
  ln -s ~/Dropbox/commshots ~/.commshots
fi

if [! -d ~/.atom ]; then
  ln -s ~/Dropbox/Apps/.atom ~/.atom
fi

if [! -d ~/Library/Application\ Support/Sublime\ Text\ 3 ]; then
  ln -s ~/Dropbox/Apps/Sublime\ Text\ 3 ~/Library/Application\ Support/Sublime\ Text\ 3
fi
