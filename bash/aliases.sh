#!/bin/bash
# Default aliases

#alias vim=vi
alias sl=exa
alias rack='ag --ruby'
alias rag='ag --ruby'
alias jack='ag --js'
alias jag='ag --js'

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

alias els="exa --color=auto --icons --long"
alias elt="exa --color=auto --icons --tree"

# exa aliases
if hash exa 2>/dev/null; then
    #alias ls='exa'
    alias l='exa -l --all --group-directories-first --git --icons'
    alias ll='exa -l --all --all --group-directories-first --git --icons'
    alias lt='exa -T --git-ignore --level=2 --group-directories-first --icons'
    alias llt='exa -lT --git-ignore --level=2 --group-directories-first --icons'
    alias lT='exa -T --git-ignore --level=4 --group-directories-first --icons'
else
    alias l='ls -lah'
    alias ll='ls -alF'
    alias la='ls -A'
fi
