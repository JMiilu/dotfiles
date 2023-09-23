# .bash/02_alias.sh
# Set aliases

# edit and rerun the last command from history
# useful when last command failed for example because of a typo
_edit_and_rerun_last_cmd() {
  local prev_cmd=$(fc -l -1 | cut -f1)

  builtin fc -e $EDITOR "$@"
  local exit_code=$?

  # remove previous command from history
  [[ -n $prev_cmd ]] && history -d -1

  return $exit_code
}

# remove all predefined aliases
unalias -a


# history manipulation
alias rr='_edit_and_rerun_last_cmd'

# misc shortcuts
alias update='sudo apt update && sudo apt upgrade'
alias week="date +%V"
alias x='exit'

# cd to top directory of a current git repository
alias gr='cd `git rev-parse --show-toplevel`'

# reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# print each PATH entry on a separate line
alias paths='echo -e ${PATH//:/\\n}'


# config/dotfiles
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'


# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'


# enable grep colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# start nano with line numbers enabled
# alias nano='nano -il'

# nano: always show cursor position (line number and column) in status bar
alias nano='nano -c'


# safer (interactive) cp, mv, and rm
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I --preserve-root'

# create all directories in the path if they don't exist
alias mkdir='mkdir -p'

# admin aliases
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# enable aliases to be sudo’ed
alias sudo='sudo '

alias set_perf_event_paranoid='echo 0 | sudo tee /proc/sys/kernel/perf_event_paranoid '

which colordiff &>/dev/null && alias diff='colordiff'
which highlight &>/dev/null && alias hl='highlight -O ansi --force'

# exa: a modern replacement for ‘ls’.
# alias ls='exa'
# alias la='exa -a'
# alias ll='exa -l --git'
# alias lll='exa -la --git'
# alias tree='exa --tree'

# bat: a cat clone with wings.
# alias cat='batcat'

# ripgrep: a faster grep that respects .gitignore
# alias grep="rg"

# tokei: count lines of code, fast
# alias cloc="tokei"
# alias calc="insect"

# alias find="fd"

