#!/usr/bin/env sh

git config --global user.email "github@ollej.com"
git config --global user.name "Olle Wreede"
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global color.diff true
git config --global color.grep true
git config --global color.interactive true
git config --global color.status true
git config --global grep.lineNumber true
git config --global commit.template $HOME/.gitmessage.txt

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
git config --global alias.ci "commit --verbose"
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.dc "diff --cached"
git config --global alias.rb "rebase -p"
git config --global alias.tree "log --graph --oneline"
git config --global alias.rm "branch -d"
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.cowboy '!f() { git checkout --track -b "ow-$1" origin/master; }; f'
git config --global alias.ignore 'update-index --assume-unchanged'
git config --global alias.unignore 'update-index --no-assume-unchanged'
git config --global alias.alias '!f() { git config --get-regexp "^alias.${1}$" ; }; f'
git config --global alias.lsa '!f() { git config --get-regexp alias | sort | sed s/^alias\.// | sed "s/[[:space:]]/	/" | expand -t 12; }; f'
git config --global alias.forcepush "push --force-with-lease"

# doge git
git config --global alias.amaze diff
git config --global alias.wow status
