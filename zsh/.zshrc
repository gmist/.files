# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

unamestr=`uname -s`

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=

# --begin setup paths--
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH


# PATH for OS X
if [[ "$unamestr" == "Darwin" ]]; then
  # command to fix dublicates in Open With menu
  alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

  # NPM
  export PATH=/usr/local/share/npm/bin:$PATH

  # Araxis Merge
  export PATH=/Applications/Araxis\ Merge.app/Contents/Utilities:$PATH

  # SublimeText 2
  alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

  # setup GOPATH
  export GOPATH=~/Dev/go
  export GOBIN=~/Dev/go/bin
  export GOROOT=/usr/local/opt/go/libexec
  export PATH=$PATH:$GOBIN:$GOROOT/bin
fi

if which ruby >/dev/null && which gem >/dev/null; then
    PATH=$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH
fi
# --end setup paths--

# --begin setup virtualenvwrapper--
export WORKON_HOME=$HOME/.venv
# --end setup virtualenvwrapper--

fpath=(/usr/local/share/zsh-completions $fpath)

# --begin vim aliases--
if [[ "$unamestr" == "Darwin" ]]; then
  export VISUAL='mvim -f'
  alias vi='mvim -v'
  alias vim='mvim -v'
  alias vimdiff='mvimdiff -v'
else
  export VISUAL='vim -v'
  alias vi='vim -v'
  alias vim='vim -v'
  alias vimdiff='vimdiff -v'
fi
# --end vim--

# fix include path for libxml2
export C_INCLUDE_PATH=/usr/local/Cellar/libxml2/2.9.1/include/libxml2:$C_INCLUDE_PATH

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gnzh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Settings for history
HIST_STAMPS="yyyy-mm-dd"
HIST_IGNORE_SPACE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  brew
  brew-cask
  docker
  forklift
  git
  github
  gitignore
  golang
  history
  mercurial
  npm
  osx
  pip
  python
  ruby
  rust
  vagrant
  virtualenvwrapper
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -d '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
