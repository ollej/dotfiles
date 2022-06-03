#!/bin/bash
# Default aliases

#alias vim=vi
alias sl=ls
alias rack='ag --ruby'
alias rag='ag --ruby'
alias jack='ag --js'
alias jag='ag --js'

alias updatectags="ctags -R --exclude=.git --exclude=logs --exclude=doc --exclude=tmp ."

# Promote aliases
alias be="bundle exec"
alias br="bundle exec rake"
alias bs="bundle exec rspec"
alias bebug='bundle exec rspec -rbyebug -rpry'
alias remigrate="bundle exec rake db:migrate && bundle exec rake db:rollback && bundle exec rake db:migrate && bundle exec rake parallel:prepare"

# Important aliases
alias poke=touch
alias dog=cat
alias such=git
alias much=git
alias very=git
alias wow='git status'
alias weather='curl -4 http://wttr.in/S%C3%B6dermalm'
alias wttr='curl -4 http://wttr.in/S%C3%B6dermalm'
alias moon='curl wttr.in/Moon'
alias thrall='ls -Urahl' # ls -thrall

# Pretty ls
export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
alias ls="ls -Fh"

