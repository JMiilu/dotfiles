# .bash/00_misc.sh

# 1. Set various environment variables which don't have a more logical
#    place or they simply must be defined here for later scripts to
#    work properly.
# 2. Set shell history settings
# 3. Set various shell options (shopt)
# 4. Load system bash completion settings

export VISUAL="vim"
export EDITOR="vim"
export PAGER="less"
export INPUTRC=~/.inputrc

# history
export HISTCONTROL=ignorespace:erasedups
export HISTFILESIZE=999999
export HISTSIZE=999999

# ignore often repeated (short) commands from history and also ignore common typos
HISTIGNORE="l:l :ll:ll :lll:lll *:la:la :laa:laa *:lla:lla *:ls:ls :lls:lls *:lss:lss *:ld:ld :sl:sl :sl *"
HISTIGNORE="$HISTIGNORE:cd:cd :cdd*:ccd:ccd *:cccd*:ccdd*:cd ..:cd..:cd .. :cd.. :cd.:cd. :cd .:cd . :cd -:cd - :cl:cl :cl *"
HISTIGNORE="$HISTIGNORE:pwd:dir:vdir:x:exit:history:history *:hisotory*:hisstory*:hisotry*:historry*:historhy*"
HISTIGNORE="$HISTIGNORE:histry:help:heko:heko *:help *:* --help:* --heko:hellp *:helpp *:hekko *:rr:rr "
HISTIGNORE="$HISTIGNORE:config:config :congig*:command:command *:commmand*:cofig*:code:code :code ."
HISTIGNORE="$HISTIGNORE:reload:reload :* --version:vim:vim :vi:vi :fc:fc :fc *:echo:echo :echo *"
HISTIGNORE="$HISTIGNORE:gr:gr :git:git :git sta:git stat:git stas:git pu:git lo:git l:git he*:git dif"
HISTIGNORE="$HISTIGNORE:git lol:git lof:git loh:git lg:git stah:git ss:git checkout -b *:git add *:git commit *"
HISTIGNORE="$HISTIGNORE:git stau:git staus:git statu:git reset*:git restore*"
HISTIGNORE="$HISTIGNORE:git rm *:rm *:git mv *:chezmoi edit:chezmoi edit *"
export HISTIGNORE

# write history to disk if last command was successful
_append_history() {
  local exit_code=$?
  if [ $exit_code -eq 0 ]; then
    history -a
  fi

  return $exit_code
}

# write history to disk before showing prompt
export PROMPT_COMMAND="_append_history"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# node version manager "n"
export N_PREFIX=$HOME/.n

# GOPATH (powerline prompt)
if [ -d "$HOME/go" ]; then
  export GOPATH="$HOME/go"
fi

# python version manager "pyenv"
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
fi

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# if set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# autocorrect typos in path names when using `cd`
shopt -s cdspell

# do not autocomplete when accidentally pressing Tab on an empty line.
shopt -s no_empty_cmd_completion

# sets vi mode for shell
# set -o vi

shopt -s autocd
shopt -s progcomp
shopt -s checkjobs

# bash completions
[ -f /etc/profile.d/bash_completion.sh ] && source /etc/profile.d/bash_completion.sh

