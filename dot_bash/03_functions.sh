# .bash/03_functions.sh
# Define functions for stuff too complicated for an alias


# source highlighting and line numbers for less

# lesscolors() {
#   env LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh --css darkblue_sh.css --no-doc %s' \
#     LESS=' --RAW-CONTROL-CHARS -N ' \
#       $(which less) $@
# }

# less() {
#   less=$(which less)
#   has_file=false
#   all_text=true

#   for arg in $@; do
#     if [[ "$arg" != -* ]] && [ -e "$arg" ]; then
#       has_file=true
#       enc=$(file -b --mime-encoding "$(realpath $arg)")

#       if [[ "$enc" != *"-ascii" ]] && [ "$enc" != "utf-8" ]; then
#         all_text=false
#         break
#       fi
#     fi
#   done

#   if [ $has_file == true ] && [ "$all_text" == true ]; then
#     less=lesscolors
#   fi

#   $less $@
# }

# # colors for man pages
# man() {
#   LESS_TERMCAP_md=$'\e[01;31m' \
#   LESS_TERMCAP_me=$'\e[0m' \
#   LESS_TERMCAP_us=$'\e[01;32m' \
#   LESS_TERMCAP_ue=$'\e[0m' \
#   LESS_TERMCAP_so=$'\e[45;93m' \
#   LESS_TERMCAP_se=$'\e[0m' \
#   command man "$@"
# }

# create a new python virtual environment in the current directory
venv() {
  [ -d ./.venv ] || python -m venv ./.venv
}

# activate python virtual environment if one exists in the current directory
activate() {
  [ -d ./.venv ] && source ./.venv/bin/activate
}

# make a new directory (with all directories in the path) and change into it
mcd() {
  mkdir -p "$1" && cd "$1";
}

# change directory and list the contents
cl() {
  DIR="$*";
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME;
  fi;
  builtin cd "${DIR}" && ls
}

# calculator
calc() {
  echo "$*" | bc -l;
}

# create a data URL from a file
dataurl() {
  local MIMETYPE=$(file --mime-type "$1" | cut -d ' ' -f2)
  if [[ $MIMETYPE == "text/*" ]]; then
    MIMETYPE="${MIMETYPE};charset=utf-8"
  fi
  echo "data:${MIMETYPE};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# trim leading and trailing whitespace
trim() {
  local var="$*"
  # remove leading whitespace characters
  var="${var#"${var%%[![:space:]]*}"}"
  # remove trailing whitespace characters
  var="${var%"${var##*[![:space:]]}"}"
  printf '%s' "$var"
}

# format python code files in the current working directory (check only)
black_check() {
  docker run --rm --volume $(pwd):/src --workdir /src pyfound/black:latest_release black --check .
}

# format python code files in the current working directory
black() {
  docker run --rm --volume $(pwd):/src --workdir /src pyfound/black:latest_release black .
}

