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
alias testing="bundle_all_the_things; prepare_test_db; test_all_the_things"
alias apps="less ~/Seafile/Server\ Info/Servers/promoteapp.net.md"
alias cluster=". ~/bin/cluster_setup"
alias nocluster="unset CLUSTER SUDO"
alias be="bundle exec"
alias br="bundle exec rake"
alias bs="bundle exec rspec"


# Important aliases
alias poke=touch
alias dog=cat
alias such=git
alias very=git
alias wow='git status'
alias weather='curl -4 http://wttr.in/S%C3%B6dermalm'
alias wttr='curl -4 http://wttr.in/S%C3%B6dermalm'
alias moon='curl wttr.in/Moon'

# Pretty ls
export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
alias ls="ls -Fh"

