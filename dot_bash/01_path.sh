# .bash/01_path.sh
# Build and set PATH variable

# powerline prompt from $GOPATH/bin (append to the end of PATH)
if [[ -n $GOPATH ]] && [[ -d "$GOPATH/bin" ]]; then
  PATH="$PATH:$GOPATH/bin"
fi

# QT_LIB_VERSION (add cmake and qmake to path)
if [[ -n $QT_LIB_VERSION ]] && [[ -d "/opt/Qt" ]]; then
  # find cmake executable
  cmake_bin=$(find /opt/Qt -type f -name "cmake" -executable -print | head -n 1)

  if [[ -x "$cmake_bin" ]]; then
    CMAKE_BIN_PATH=$(dirname ${cmake_bin})
    [[ :$PATH: == *":$CMAKE_BIN_PATH:"* ]] || PATH="$CMAKE_BIN_PATH:$PATH"
  fi

  if [[ -d "/opt/Qt/${QT_LIB_VERSION}" ]]; then
    # find qmake executable
    qmake_bin=$(find /opt/Qt/${QT_LIB_VERSION} -type f -name "qmake" -executable -print | head -n 1)

    if [[ -x "$qmake_bin" ]]; then
      QT_BIN_PATH=$(dirname ${qmake_bin})
      [[ :$PATH: == *":$QT_BIN_PATH:"* ]] || PATH="$QT_BIN_PATH:$PATH"
    fi
  fi
fi

# node version manager "n"
if [[ -n $N_PREFIX ]] && [[ -d "$N_PREFIX/bin" ]]; then
  [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$N_PREFIX/bin:$PATH"
fi

# python version manager "pyenv"
if [[ -n $PYENV_ROOT ]] && [[ -d "$PYENV_ROOT/bin" ]]; then
  command -v pyenv >/dev/null || PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# ~/.local/bin
if [[ -d "$HOME/.local/bin" ]] && [[ -d "$HOME/.local/bin" ]]; then
  [[ :$PATH: == *":$HOME/.local/bin:"* ]] || PATH="$HOME/.local/bin:$PATH"
fi

# ~/.bin
if [[ -d "$HOME/.bin" ]] && [[ -d "$HOME/.bin" ]]; then
    [[ :$PATH: == *":$HOME/.bin:"* ]] || PATH="$HOME/.bin:$PATH"
fi

# ~/bin
if [[ -d "$HOME/bin" ]] && [[ -d "$HOME/bin" ]]; then
    [[ :$PATH: == *":$HOME/bin:"* ]] || PATH="$HOME/bin:$PATH"
fi

export PATH

