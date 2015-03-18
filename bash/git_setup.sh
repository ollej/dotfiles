#!/usr/bin/env sh

git config --global user.email "Olle@Johansson.com"
git config --global user.name "Olle Johansson"
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global color.diff true
git config --global color.grep true
git config --global color.interactive true
git config --global color.status true
git config --global grep.lineNumber true
git config --global commit.template $HOME/.gitmessage.txt

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
git config --global alias.amaze diff
git config --global alias.ci "commit --verbose"
git config --global alias.co checkout
git config --global alias.dc "diff --cached"
git config --global alias.rb "rebase -p"
git config --global alias.tree "log --graph --oneline"
git config --global alias.rm "branch -d"
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
