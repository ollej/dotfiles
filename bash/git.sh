function git_current_branch() {
    git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

alias gpthis='git push origin HEAD:$(git_current_branch)'
alias grb='git rebase -p'
alias gup='git fetch origin && grb origin/$(git_current_branch)'
alias gm='git merge --no-ff'
alias gd='vim -p `git diff --name-only`'
alias gstat='git diff --stat'
alias glog='git log --pretty=format:"[%h] %ae, %ar: %s" --stat'
alias gstaged='git diff --cached'

export GIT_EDITOR=vim
export GIT_PAGER=less

source ~/.bash/git-completion.bash
