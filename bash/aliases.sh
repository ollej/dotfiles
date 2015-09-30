#!/bin/bash
# Default aliases

#alias vim=vi
alias sl=ls
alias rack='ack --ruby'
alias jack='ack --js'
#alias testing="pushd ~/Development/promote/admin && bundle exec rake db:drop db:create db:migrate db:test:prepare i18nlite:sync db:seed; cd ..; ls */spec/dummy/db/schema.rb | xargs -n 1 cp -v admin/db/schema.rb; cd i18nlite-gem/ && bundle --quiet && bundle exec rake app:spec; cd ../base/ && bundle --quiet && bundle exec rake app:spec; cd ../site && bundle --quiet && bundle exec rake js:spec spec && cd ../admin && bundle --quiet && bundle exec rake js:spec spec; popd"
alias updatectags="ctags -R --exclude=.git --exclude=logs --exclude=doc --exclude=tmp ."

# Promote aliases
alias postmigrate="pushd ~/Development/promote/admin; bundle exec rake db:test:prepare; cd ..; ls */spec/dummy/db/schema.rb | xargs -n 1 cp -v admin/db/schema.rb; cd admin_core; bundle exec app:db:test:prepare ; cd ../base; bundle exec app:db:test:prepare; popd"
alias prepare_test_db="pushd ~/Development/promote/admin; bundle exec rake db:drop db:create db:migrate db:test:prepare db:seed; cd ../site; cp ../admin/db/schema.rb db/schema.rb; bundle exec rake db:seed; cd ..; ls */spec/dummy/db/schema.rb | xargs -n 1 cp -v admin/db/schema.rb; popd"
alias bundle_all_the_things="pushd ~/Development/promote/admin; bundle --quiet; cd ../admin_core; bundle --quiet; cd ../base; bundle --quiet; cd ../site; bundle --quiet; cd ../i18nlite-gem; bundle --quiet; popd"
alias test_all_the_things="pushd ~/Development/promote/i18nlite-gem && bundle exec rspec; cd ../base/ && bundle exec rake app:spec; cd ../site && bundle exec rake js:spec spec && cd ../admin && bundle exec rake js:spec spec; popd"
alias testing="bundle_all_the_things; prepare_test_db; test_all_the_things"
alias apps="less ~/Seafile/Server\ Info/Servers/promoteapp.net.md"
alias cluster=". ~/bin/cluster_setup"
alias nocluster="unset CLUSTER SUDO"

# Important aliases
alias poke=touch
alias dog=cat
alias such=git
alias very=git
alias wow='git status'

# Pretty ls
export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
alias ls="ls -Fh"

