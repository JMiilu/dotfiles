# .bash/05_powerline_prompt.sh
# Setup powerline prompt

which powerline-go &>/dev/null || return
POWERLINE=$(which powerline-go)

function _update_ps1() {
  PS1="$(powerline-go -cwd-max-depth 3 -hostname-only-if-ssh -newline -error $?)"
}

if [ "$TERM" != "linux" ] && [ -x $POWERLINE ]; then
    export PROMPT_COMMAND="$PROMPT_COMMAND; _update_ps1"
fi

