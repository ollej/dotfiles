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
alias prepare_test_db="pushd ~/Development/promote/promote; bundle exec rake db:drop db:create db:migrate db:test:prepare db:seed; popd"
alias i18nsync='pushd ~/Development/promote/promotw; bundle exec rake i18nlite:clear_cache i18nlite:sync i18nlite:trim_keys; popd'
alias apps="less ~/Seafile/Server\ Info/Servers/promoteapp.net.md"
alias gudapps='less ~/Seafile/Server\ Info/Servers/promote-gud.md'
alias cluster=". ~/bin/cluster_setup"
alias nocluster="unset CLUSTER SUDO"
alias be="bundle exec"
alias br="bundle exec rake"
alias bs="bundle exec rspec"

# Promote dev aliases
alias promote='cd ~/Development/promote/promote'
alias gud='cd ~/Development/promote/ansible/repos/promote-gud'
alias release='cd ~/Development/promote/promote-release'
alias fetch='cd ~/Developmen/promotet/ansible/repos/assessor'

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

