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

  echo 'Install homebrewed python@2'
  if [ ! -f /usr/local/bin/python2 ]; then
    brew install python@2
    /usr/local/bin/pip2 install -U pip setuptools
  fi

  echo "Check virtualenvwrapper..."
  which virtualenvwrapper.sh > /dev/null
  if [ "$?" != "0" ]; then
    echo "Oops... 'virtualenvwrapper' was not found, install it now"
    /usr/local/bin/pip2 install virtualenvwrapper
  fi

else
  echo "TODO: Add linux checker"
fi


if [ ! -d ~/.files ]; then
  cd ~
  git clone https://github.com/gmist/.files.git
else
  cd ~/.files
  git pull
fi


cd ~/.files
for dir in */; do
  if [ -d "$dir" ]; then
    echo "Install ${dir}"
    stow -t ~ $dir
  fi
done


if [ ! -d ~/.oh-my-zsh ]; then
  cd ~
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
else
  which upgrade_oh_my_zsh > /dev/null
  if [ "$?" != "0" ]; then
    echo "Oops... try to update oh-my-zsh via git" 
    cd ~/.oh-my-zsh
    git pull --rebase --stat origin master
  else
    echo "Update oh-my-zsh"
    upgrade_oh_my_zsh
  fi
fi


if [ ! -d ~/.ve ]; then
  mkdir ~/.ve
fi


if [ ! -d ~/.commshots ]; then
  mkdir ~/.commshots
fi
