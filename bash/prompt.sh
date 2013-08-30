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
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")${NO_COLOR}"
}

# Detect whether the current directory is a subversion repository.
function is_svn_repository {
    test -d .svn
}

# Detect whether the current directory is a git repository.
function is_git_repository {
    git branch > /dev/null 2>&1
}

# Determine the branch information for this subversion repository. No support
# for svn status, since that needs to hit the remote repository.
function set_svn_branch {
    # Capture the output of the "git status" command.
    svn_info="$(svn info | egrep '^URL: ' 2> /dev/null)"

    # Get the name of the branch.
    branch_pattern="^URL: .*/(branches|tags)/([^/]+)"
    trunk_pattern="^URL: .*/trunk(/.*)?$"
    if [[ ${svn_info} =~ $branch_pattern ]]; then
        branch=${BASH_REMATCH[2]}
    elif [[ ${svn_info} =~ $trunk_pattern ]]; then
        branch='trunk'
    fi

    # Set the final branch string.
    BRANCH="(${branch}) "
}

# Determine the branch/state information for this git repository.
function set_git_branch {
    # Capture the output of the "git status" command.
    git_status="$(git status 2> /dev/null)"

    # Set color based on clean/staged/dirty.
    if [[ ${git_status} =~ "working directory clean" ]]; then
        state="${GREEN}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
        state="${YELLOW}"
    else
        state="${RED}"
    fi

    # Set arrow icon based on status against remote.
    remote_pattern="# Your branch is (.*) of"
    if [[ ${git_status} =~ ${remote_pattern} ]]; then
        if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
            remote="↑"
        else
            remote="↓"
        fi
    else
        remote=""
    fi
    diverge_pattern="# Your branch and (.*) have diverged"
    if [[ ${git_status} =~ ${diverge_pattern} ]]; then
        remote="↕"
    fi

    # Get the name of the branch.
    branch_pattern="^# On branch ([^${IFS}]*)"
    if [[ ${git_status} =~ ${branch_pattern} ]]; then
        branch=${BASH_REMATCH[1]}
    fi

    # Set the final branch string.
    BRANCH="${state}(${branch})${remote}${NO_COLOR} "
}

function set_user {
    local COLOR="$WHITE"
    case "$USER" in
        root)   COLOR="${BOLD_RED}" ;;
        olle)   COLOR="${GREEN}" ;;
        olljoh) COLOR="${GREEN}" ;;
        *)      COLOR="${YELLOW}" ;;
    esac
    USERNAME="${COLOR}${USER}${NO_COLOR}"
}

function set_host {
    # Add color depending on environment
    HOST="$(uname -n)"
    case "$HOST" in
        Olles-MacBook-Pro.local) COLOR="${CYAN}"; HOST="macbook" ;;
        bob) COLOR="${BOLD_CYAN}" ;;
        www1.test)  COLOR="${BOLD_YELLOW}" ;;
        root)       COLOR="${BOLD_RED}" ;;
        *)          COLOR="${YELLOW}" ;;
    esac
    HOST="${COLOR}${HOST}${NO_COLOR}"
}

function set_dir {
    DIR="$(pwd)"
    DIR="${DIR/$HOME/~}"
    # Add color depending on path
    local COLOR="$WHITE"
    case "$DIR" in
        ~)                 COLOR="${BOLD_WHITE}" ;;
        */Development/*)   COLOR="${YELLOW}" ;;
        */chewbacca_dev/*) COLOR="${GREEN}" ;;
        */rf-git/*)        COLOR="${BOLD_WHITE}" ;;
    esac
    DIR="${COLOR}${DIR}${NO_COLOR}"
}

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function set_prompt_symbol () {
    if test $1 -eq 0 ; then
        PROMPT_SYMBOL="\$"
    else
        PROMPT_SYMBOL="${RED}\$"
    fi
}

function setup_prompt {
    # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
    # return value of the last command.
    set_prompt_symbol $?

    # Set the BRANCH variable.
    if is_git_repository ; then
        set_git_branch
    elif is_svn_repository ; then
        set_svn_branch
    else
        BRANCH=''
    fi

    # Setup dir/user etc with colors
    set_dir
    set_user
    set_host

    # Show debian chroot at begininning of prompt
    local CHROOT="${BOLD_WHITE}${debian_chroot:+($debian_chroot)}${NO_COLOR}"

    PS1="${CHROOT}${USERNAME}${WHITE}@${HOST}${WHITE}:${DIR} ${BRANCH}${PROMPT_SYMBOL} ${NO_COLOR}"
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=setup_prompt

