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

# SSH host completion
source $HOME/.bash/hosts_completion.sh

# Dir jump: http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
source $HOME/.bash/marks.sh

#export CLICOLOR_FORCE=1             # Force color on non-interactive (e.g. pipe to less)
export LESS="--RAW-CONTROL-CHARS"   # Make ANSI colors work in less

export EDITOR=vim

export PATH=/usr/local/bin:$PATH

# Better locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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

PERL_MB_OPT="--install_base \"/Users/olle/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/olle/perl5"; export PERL_MM_OPT;
export ES_HOME=/usr/local/Cellar/elasticsearch/1.3.2/
export KEY=~/Seafile/Server\ Info/Keys/avidity_second.key

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

