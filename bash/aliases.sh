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
alias prepare_test_db="pushd ~/Development/promote/promote; bundle exec rake db:drop db:create db:migrate parallel:prepare db:seed; popd"
alias i18nsync='pushd ~/Development/promote/promote; bundle exec rake i18nlite:clear_cache i18nlite:sync i18nlite:trim_keys; popd'
alias apps="less ~/Seafile/Server\ Info/Servers/promoteapp.net.md"
alias gudapps='less ~/Seafile/Server\ Info/Servers/promote-gud.md'
alias cluster=". ~/bin/cluster_setup"
alias nocluster="unset CLUSTER SUDO"
alias be="bundle exec"
alias br="bundle exec rake"
alias bs="bundle exec rspec"
alias bebug='bundle exec rspec -rbyebug -rpry'
alias remigrate="bundle exec rake db:migrate && bundle exec rake db:rollback && bundle exec rake db:migrate && bundle exex rake parallel:prepare"

# Promote dev aliases
alias promote='cd ~/Development/promote/promote'
alias gud='cd ~/Development/promote/ansible/repos/promote-gud'
alias release='cd ~/Development/promote/promote-release'
alias fetch='cd ~/Development/promote/assessor'

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

