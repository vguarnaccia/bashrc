###############################################################################
# Alias Basic Commands
###############################################################################

# Colorize Commands
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias less='less --RAW-CONTROL-CHARS --LINE-NUMBERS --LONG-PROMPT'

# Some more ls aliases
alias ll='ls -AhlF'
alias l='ls -CF'
alias cd..='cd ..' # common typo

# Easily move around directories
function cdl { cd "$1"; ls; }
function mkcd { mkdir -p -- "$1"; cd -P -- "$1"; }
function up
{
    for ((i=1; i<=$1; i++));
    do
        cd ..
    done;
}

# Better than `which`
alias whence='type -a'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Avoid mistakes
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'

# Add an "alert" alias for long running commands.  Use like so:
# $ sleep 10; alert
alias alert='; notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias H='| head'
alias L='| less'

alias bashrc='$EDITOR ~/.bashrc'
alias zshrc='$EDITOR ~/.zshrc'

# Useful unarchiver!
function extract {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2) tar xjf "$1"   ;;
            *.tar.gz)  tar xzf "$1"   ;;
            *.bz2)     bunzip2 "$1"   ;;
            *.rar)     rar x "$1"     ;;
            *.gz)      gunzip "$1"    ;;
            *.tar)     tar xf "$1"    ;;
            *.tbz2)    tar xjf "$1"   ;;
            *.tgz)     tar xzf "$1"   ;;
            *.zip)     unzip "$1"     ;;
            *.Z)       uncompress "$1";;
            *)         echo "'$1' cannot be extracted via extract()";;
            esac
    else
            echo "'$1' is not a valid file"
    fi
}

###############################################################################
# Git Abbreviations
###############################################################################

alias gs='git status -sb'
alias ga='git add'
alias gd='git diff'
alias gdc='git diff --cached'
alias gmv='git mv'
alias grm='git rm'
alias grc='git rm --cached'
function gc { git commit -m "$*"; }
alias gl="git log --max-count=40 --graph --pretty=format:'%C(yellow)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'" # pretty log
alias gpl='git pull'
alias gpu='git push'
alias gbr='git branch -vv'
alias gco='git checkout'
alias gst='git stash'

# Set the cache to timeout after 1 hour (setting is in seconds)
alias gcache="git config --global credential.helper 'cache --timeout=3600'"
