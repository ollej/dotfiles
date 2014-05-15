#!/bin/bash
# Default aliases

#alias vim=vi
alias cvsst="cvs -q st | grep -vE 'revision|Sticky|^$|==|Commit' | sed -r 's/^File: |Status: //g'"
alias cvsup="cvs -q up -dP"
alias sl=ls
alias rack='ack --ruby'
alias jack='ack --js'
alias testing="cd admin && rake db:drop db:create db:migrate db:test:prepare i18n:import db:seed; cd ..; ls */spec/dummy/db/schema.rb | xargs -n 1 cp -v admin/db/schema.rb; cd i18n/ && bundle --quiet && rake app:spec; cd ../base/ && bundle --quiet && rake app:spec; cd ../site && bundle --quiet && rake js:spec spec && cd ../admin && bundle --quiet && rake js:spec spec"
alias updatectags="ctags -R --exclude=.git --exclude=logs --exclude=doc --exclude=tmp ."

# Pretty ls
export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
alias ls="ls -Fh"

