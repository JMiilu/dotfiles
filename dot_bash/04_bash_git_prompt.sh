# .bash/04_bash_git_prompt.sh
# Setup bash-git-prompt

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
  # Set config variables first
  GIT_PROMPT_ONLY_IN_REPO=1

  # uncomment to avoid fetching remote status
  # GIT_PROMPT_FETCH_REMOTE_STATUS=0
 
  # uncomment to avoid searching for changed files in submodules
  # GIT_PROMPT_IGNORE_SUBMODULES=1
 
  # uncomment to avoid setting virtual environment infos for
  # node/python/conda environments
  # GIT_PROMPT_WITH_VIRTUAL_ENV=0

  # uncomment to show upstream tracking branch
  # GIT_PROMPT_SHOW_UPSTREAM=1

  # can be no, normal or all; determines counting of untracked files
  # GIT_PROMPT_SHOW_UNTRACKED_FILES=normal

  # uncomment to avoid printing the number of changed files
  # GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0

  # uncomment to support Git older than 1.7.10
  # GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh

  # GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
  # GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

  # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
  # GIT_PROMPT_THEME=Custom
  # GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
 
  # use theme optimized for solarized color scheme
  # GIT_PROMPT_THEME=Solarized

  # as last entry source the gitprompt script
  source $HOME/.bash-git-prompt/gitprompt.sh
fi

