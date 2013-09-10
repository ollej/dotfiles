#!/bin/bash
# Default aliases

#alias vim=vi
alias cvsst="cvs -q st | grep -vE 'revision|Sticky|^$|==|Commit' | sed -r 's/^File: |Status: //g'"
alias cvsup="cvs -q up -dP"
alias sl=ls
alias rack='ack --ruby --pager="less -R"'
alias testing="rake db:drop db:create db:migrate db:test:prepare && rake i18n:import_translations db:seed; ls dependencies/promote-*/spec/dummy/db/schema.rb | xargs -n 1 cp -v db/schema.rb; cd dependencies/promote-i18n/ && bundle && rake app:spec; cd ../promote-models/ && bundle && rake app:spec; cd ../promote-builder && bundle && rake app:spec app:jasmine:headless; cd ../.. && bundle && rake konacha:run spec"
alias updatectags="ctags -R --exclude=.git --exclude=logs --exclude=doc --exclude=tmp ."

# Pretty ls
export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
alias ls="ls -Fh"

