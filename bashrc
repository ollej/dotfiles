#!/bin/bash

# Stop ^s from freezing terminal
stty stop 'undef'

# Source extra config files
source $HOME/.bash/aliases.sh
source $HOME/.bash/git.sh
source $HOME/.bash/prompt.sh
# Vim Powerline bindings
#source /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# Support completion for rake tasks
source $HOME/.bash/rake_completion.sh

#export CLICOLOR_FORCE=1             # Force color on non-interactive (e.g. pipe to less)
export LESS="--RAW-CONTROL-CHARS"   # Make ANSI colors work in less

export EDITOR=vim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

# Vim gpg
export GPG_TTY=`tty`

# pyenv
eval "$(pyenv init -)"

# perlbrew
#source ~/perl5/perlbrew/etc/bashrc
