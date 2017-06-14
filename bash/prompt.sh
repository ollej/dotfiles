#!/usr/bin/env sh

# Setup colors
BLACK="\[\033[0;30m\]"
BOLD_BLACK="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
BOLD_RED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
BOLD_GREEN="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
BOLD_YELLOW="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BOLD_BLUE="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
BOLD_PURPLE="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
BOLD_CYAN="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
BOLD_WHITE="\[\033[1;37m\]"
NO_COLOR="\[\033[0m\]"

function get_git_branch {
  git symbolic-ref --short HEAD --quiet
}

# Detect whether the current directory is a subversion repository.
function is_svn_repository {
    test -d .svn
}

# Detect whether the current directory is a git repository.
function is_git_repository {
    [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" == 'true' ]
}

# Determine the branch information for this subversion repository. No support
# for svn status, since that needs to hit the remote repository.
function get_svn_prompt {
    # Capture the output of the "git status" command.
    local svn_info="$(svn info | egrep '^URL: ' 2> /dev/null)"

    # Get the name of the branch.
    local branch_pattern="^URL: .*/(branches|tags)/([^/]+)"
    local trunk_pattern="^URL: .*/trunk(/.*)?$"
    if [[ ${svn_info} =~ $branch_pattern ]]; then
        local branch=${BASH_REMATCH[2]}
    elif [[ ${svn_info} =~ $trunk_pattern ]]; then
        local branch='trunk'
    fi

    # Set the final branch string.
    echo "(${branch}) "
}

# Set arrow icon based on status against remote.
function get_git_remote_status {
    local rev_local=$(git rev-parse @ 2> /dev/null)
    local rev_remote=$(git rev-parse @{u} 2> /dev/null)
    local rev_base=$(git merge-base @ @{u} 2> /dev/null)

    if [ -z "$rev_remote" ]; then
        echo "♨" # No remote
    elif [ "$rev_local" = "$rev_remote" ]; then
        echo "✔" # Up-to-date
    elif [ "$rev_local" = "$rev_base" ]; then
        echo "↓" # Need to pull
    elif [ "$rev_remote" = "$rev_base" ]; then
        echo "↑" # Need to push
    else
        echo "⇵" # Diverged
    fi
}

function git_uncommitted_changes {
    git diff --cached --exit-code 2>&1 >/dev/null
    [ $? -gt 0 ]
}

function git_unstaged_changes {
    git diff --exit-code 2>&1 >/dev/null
    [ $? -gt 0 ]
}

# Determine the branch/state information for this git repository.
function get_git_prompt {
    # Set color based on clean/staged/dirty.
    if git_unstaged_changes ; then
        local state="${RED}"
    elif git_uncommitted_changes ; then
        local state="${GREEN}"
    else
        local state="${GREEN}"
    fi

    # Set the final branch string.
    echo "${state}($(get_git_branch))$(get_git_remote_status)${NO_COLOR} "
}

function get_user {
    local color="$WHITE"
    case "$USER" in
        root)   local color="${BOLD_RED}" ;;
        olle)   local color="${GREEN}" ;;
        olljoh) local color="${GREEN}" ;;
        *)      local color="${YELLOW}" ;;
    esac
    echo "${color}${USER}${NO_COLOR}"
}

function get_host {
    # Add color depending on environment
    local host="$(uname -n)"
    case "$host" in
        Lamarr.local)   local color="${CYAN}"; host="" ;; #host="Lamarr" ;;
        Hamilton.local) local color="${CYAN}"; host="" ;;
        bob)            local color="${BOLD_CYAN}" ;;
        *)              local color="${YELLOW}" ;;
    esac
    echo "${color}${host}${NO_COLOR}"
}

function get_dir {
    local dir="$(pwd)"
    local dir="$(echo $dir | sed 's/\/Users\/olle/~/')"
    local dir="$(echo $dir | sed 's/\/home\/olle/~/')"
    # Strip all but last part
    dir=$(basename "$dir")
    # Add color depending on path
    local color="$WHITE"
    case "$dir" in
        olle | ~)      local color="${BOLD_WHITE}" ;;
        Development)   local color="${YELLOW}" ;;
        promote)       local color="${BOLD_YELLOW}" ;;
        Dropbox)       local color="${GREEN}" ;;
        Downloads)     local color="${BLUE}" ;;
    esac
    echo "${color}${dir}${NO_COLOR}"
}

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function get_prompt_symbol {
    local EXITCODE=$1

    if test $EXITCODE -eq 0 ; then
        echo "${GREEN}\$"
    else
        echo "${RED}[$EXITCODE] \$"
    fi
}

function get_cluster {
    if [ -n "$CLUSTER" ]; then
        echo "${BOLD_PURPLE}«${CLUSTER}» ${NO_COLOR}"
    elif [ -n "$SERVICE" ]; then
        echo "${PURPLE}«${SERVICE}» ${NO_COLOR}"
    fi
}

# Set the BRANCH variable.
function get_branch {
    if is_git_repository ; then
        get_git_prompt
    elif is_svn_repository ; then
        get_svn_prompt
    fi
}

# Show debian chroot at begininning of prompt
function get_chroot {
    echo "${BOLD_WHITE}${debian_chroot:+($debian_chroot)}${NO_COLOR}"
}

function setup_prompt {
    # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
    # return value of the last command.
    local prompt_symbol=$(get_prompt_symbol $?)

    PS1="${get_chroot}$(get_cluster)$(get_user)${WHITE}@$(get_host)${WHITE}:$(get_dir) $(get_branch)${prompt_symbol} ${NO_COLOR}"
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=setup_prompt

