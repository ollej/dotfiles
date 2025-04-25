#!/bin/bash
# Default aliases

#alias vim=vi
alias sl=eza
alias rack='rg -t ruby'
alias rag='rg -t ruby'
alias jack='rg -t js'
alias jag='rg -t js'
alias rrg='rg -t rust'

alias updatectags="ctags -R --exclude=.git --exclude=logs --exclude=doc --exclude=tmp ."

# Promote aliases
alias be="bundle exec"
alias br="bundle exec rails"
alias bs="bundle exec rspec"
alias bebug='bundle exec rspec -rbyebug -rpry'
alias remigrate="bundle exec rails db:migrate && bundle exec rails db:rollback && bundle exec rails db:migrate"
alias bdm="bundle install && bundle exec rails db:migrate"

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

alias els="eza --color=auto --icons --long"
alias elt="eza --color=auto --icons --tree"

# eza aliases
if hash eza 2>/dev/null; then
    #alias ls='eza'
    alias l='eza -l --all --group-directories-first --git --icons'
    alias ll='eza -l --all --all --group-directories-first --git --icons'
    alias lt='eza -T --git-ignore --level=2 --group-directories-first --icons'
    alias llt='eza -lT --git-ignore --level=2 --group-directories-first --icons'
    alias lT='eza -T --git-ignore --level=4 --group-directories-first --icons'
else
    alias l='ls -lah'
    alias ll='ls -alF'
    alias la='ls -A'
fi
