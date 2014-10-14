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
  #echo "("${ref#refs/heads/}")${NO_COLOR}"
  echo ${ref#refs/heads/}
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

# Determine the branch/state information for this git repository.
function get_git_prompt {
    # Capture the output of the "git status" command.
    local git_status="$(git status 2> /dev/null)"

    # Set color based on clean/staged/dirty.
    if [[ ${git_status} =~ "working directory clean" ]]; then
        local state="${GREEN}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
        local state="${YELLOW}"
    else
        local state="${RED}"
    fi

    # Set arrow icon based on status against remote.
    local remote_pattern="# Your branch is (.*) of"
    if [[ ${git_status} =~ ${remote_pattern} ]]; then
        if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
            local remote="↑"
        else
            local remote="↓"
        fi
    else
        local remote=""
    fi
    local diverge_pattern="# Your branch and (.*) have diverged"
    if [[ ${git_status} =~ ${diverge_pattern} ]]; then
        local remote="↕"
    fi

    # Get the name of the branch.
    #branch_pattern="^# On branch ([^${IFS}]*)"
    #if [[ ${git_status} =~ ${branch_pattern} ]]; then
    #    branch=${BASH_REMATCH[1]}
    #fi
    local branch=$(get_git_branch)

    # Set the final branch string.
    echo "${state}(${branch})${remote}${NO_COLOR} "
}

function get_user {
    local COLOR="$WHITE"
    case "$USER" in
        root)   local COLOR="${BOLD_RED}" ;;
        olle)   local COLOR="${GREEN}" ;;
        olljoh) local COLOR="${GREEN}" ;;
        *)      local COLOR="${YELLOW}" ;;
    esac
    echo "${COLOR}${USER}${NO_COLOR}"
}

function get_host {
    # Add color depending on environment
    local HOST="$(uname -n)"
    case "$HOST" in
        Lamarr.local) local COLOR="${CYAN}"; HOST="Lamarr" ;;
        bob)          local COLOR="${BOLD_CYAN}" ;;
        *)            local COLOR="${YELLOW}" ;;
    esac
    echo "${COLOR}${HOST}${NO_COLOR}"
}

function get_dir {
    local DIR="$(pwd)"
    local DIR="$(echo $DIR | sed 's/\/Users\/olle/~/')"
    local DIR="$(echo $DIR | sed 's/\/home\/olle/~/')"
    # Add color depending on path
    local COLOR="$WHITE"
    case "$DIR" in
        ~)                 local COLOR="${BOLD_WHITE}" ;;
        */Development/*)   local COLOR="${YELLOW}" ;;
        */Dropbox/*)       local COLOR="${GREEN}" ;;
        */Downloads/*)     local COLOR="${BLUE}" ;;
        */rf-git/*)        local COLOR="${BOLD_WHITE}" ;;
    esac
    local DIR="${COLOR}${DIR}${NO_COLOR}"
    echo $DIR
}

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function get_prompt_symbol {
    local EXITCODE=$1
    if test $EXITCODE -eq 0 ; then
        local PROMPT_SYMBOL="${GREEN}\$"
    else
        local PROMPT_SYMBOL="${RED}[$EXITCODE] \$"
    fi
    echo $PROMPT_SYMBOL
}

function setup_prompt {
    # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
    # return value of the last command.
    local PROMPT_SYMBOL=$(get_prompt_symbol $?)

    # Set the BRANCH variable.
    if is_git_repository ; then
        local BRANCH=$(get_git_prompt)
    elif is_svn_repository ; then
        local BRANCH=$(get_svn_prompt)
    else
        local BRANCH=''
    fi

    # Setup dir/user etc with colors
    local DIR=$(get_dir)
    local USERNAME=$(get_user)
    local HOST=$(get_host)

    # Show debian chroot at begininning of prompt
    local CHROOT="${BOLD_WHITE}${debian_chroot:+($debian_chroot)}${NO_COLOR}"

    PS1="${CHROOT}${USERNAME}${WHITE}@${HOST}${WHITE}:${DIR} ${BRANCH}${PROMPT_SYMBOL} ${NO_COLOR}"
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=setup_prompt

