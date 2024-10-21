# .bash/06_cdpath.sh
# Build and set CDPATH variable

return

CDPATH=""

# ~/projects/tuni
if [ -d ~/projects/tuni ]; then
  CDPATH="$CDPATH:~/projects/tuni"
fi

# ~/projects
if [ -d ~/projects ]; then
  CDPATH="$CDPATH:~/projects"
fi

# ~/projects/omat
if [ -d ~/projects/omat ]; then
  CDPATH="$CDPATH:~/projects/omat"
fi

# ~/projects/tredu
if [ -d ~/projects/tredu ]; then
  CDPATH="$CDPATH:~/projects/tredu"
fi

CDPATH=".:$CDPATH"
CDPATH="$CDPATH:~"
export CDPATH

