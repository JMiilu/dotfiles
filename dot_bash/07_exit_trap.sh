# .bash/07_exit_trap.sh
# Define functions and set a trap for shell exit

declare -A history_lines

# Read history lines to an associative array
# with line as key and line number as value.
# Save only the largest/last line number for duplicate lines
read_history_to_array() {
  local line_number=1

  while read -r line; do
    line=${line%%[[:space:]]}
    history_lines["$line"]=$line_number
    ((line_number++))
  done < ~/.bash_history
}

# Sort history lines based on their line number and print the sorted history
sort_and_print_history() {
  for line in "${!history_lines[@]}"; do
    num=${history_lines["$line"]}
    printf "%d\t%s\n" $num "$line" 
  done |
    sort -g -k1 |
    cut -s --fields=2
}

# Make a backup of ~/.bash_history
backup_bash_history() {
  [[ -f ~/.bash_history.bak ]] && rm -f ~/.bash_history.bak
  cp ~/.bash_history ~/.bash_history.bak
}

# Rewrite ~/.bash_history
# Preserve only unique lines and their order based on history
update_bash_history() {
  backup_bash_history
  read_history_to_array
  sort_and_print_history > ~/.bash_history
}

# delete history files from $HOME dir except ~/.bash_history
cleanup_home_dir() {
  for file in $(ls ~/.*_history); do
    if [[ ${file}=~bash_history ]]; then
      continue
    fi

    rm -f ${file}
  done
}

trap_shell_exit() {
  # If not running interactively, don't do anything
  case $- in
    *i*) ;;
      *) return;;
  esac

  update_bash_history
  cleanup_home_dir
}

trap trap_shell_exit EXIT

