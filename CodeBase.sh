# FILE     sturm.sh
# PACKAGE  Maintenance
# AUTHOR   Andreas Neubacher
#
# CONTENT
#   Auxiliary functions for STURM shell scripts.
#
# COPYRIGHT (C)  STURM Project, 1995 RISC Linz

#F help . . . . . . . . . . . . . . . . . . . . . Writes help text to STDERR.

help() {
  if [ "$ARGV0" = "" ]; then
    ARGV0=`basename $0`
  fi
  awk '/^#F /,/^$/' <$0 \
  | sed "s/^#F [A-Za-z][^ ]*/$ARGV0/; s/^#//" >&2
}


#F nlecho . . . . Echo which does not end the line with a newline character.

nlecho () {
  if [ "`echo -n`" = "-n" ]; then
    echo $*
  else
    echo -n $*
  fi
}

 
#F qecho . . . . . . Echo which is quiet if the variable "SturmQUIET" is set.

qecho() {
  if [ "$SturmQUIET" = "" ]; then
    echo $*
  fi
}

 
#F eecho . . . . Echo to STDERR which begins the line with "FILE: Error --".

eecho () {
  if [ "$ARGV0" = "" ]; then
    ARGV0=`basename $0`
  fi
  echo >&2 "$ARGV0: Error --" $*
}

 
#F qcat . . . . . . . Cat which is quiet if the variable "SturmQUIET" is set.

qcat() {
  if [ "$SturmQUIET" = "" ]; then
    cat $*
  fi
}

 
#F ecat . . . . . . . . . . . . . . . . . . . . . . . . . . . Cat to STDERR.

ecat () {
  cat >&2
}

 
#F errexit EXIT MSG . . . . Writes MSG to STDERR and aborts with status EXIT.

errexit() {
  exitval=$1; shift
  eecho $*
  exit $exitval
}

 
#F yes [TEXT] . . . . . . . . . . .  Infinitely writes TEXT ("y" by default).

yes() {
  while true; do
    if [ $# = 0 ]; then  echo y
    else		 echo $*
    fi
  done
}


#F which COMMAND  . . . . . . . . . Check whether COMMAND exists on the path.

which() {
  OLDWHICHIFS="$IFS"
  IFS=:
  for whichi in $PATH; do
    if [ -x $whichi/$1 ]; then
      echo $whichi/$1
      IFS=$OLDWHICHIFS
      return 0
    fi
  done
  IFS=$OLDWHICHIFS
  return 1
}

 
#F isdir DIR . . . . 0 if DIR is a real directory (no softlink), 1 otherwise.

isdir() {
#  test -d "$1" -a ! -L "$1"
  test -d "$1" && (ls -ld "$1" | grep -v ' -> ' >/dev/null)
}

 
#F packages . . . . Lists packages that are already part of the STURM library.

packages() {
  PACKAGES_PWD=`pwd`; cd $CodeBaseRoot/src; ls -d *; cd $PACKAGES_PWD
}

 
#F delfiles . . .  Lists a package's files deleted from the main tree.

delfiles() {
  if [ "$PACKAGE" = "Maintenance" ]; then
    echo Makefile
    find doc lib -type f \( -name 'Makefile' \) -print
    echo doc/Texi/Configuration.texi
    echo doc/Texi/Packages.head
  fi
  find doc/Texi/$PACKAGE -type f \( -name '*.texi' \) -print
  find examples/$PACKAGE src/$PACKAGE tools/$PACKAGE -type f \
    \( -name '*.[ch]' -o -name '*.cc' -o -name '*.hh' -o -name '*.icc' -o \
       -name '*.tcc' -o -name '*.itc' -o -name '*.y' -o -name '*.l' -o \
       -name '*.irq' -o -name Makefile \) \
    -print
  find include/$ENVIRONMENT -type f \( -name "$PACKAGE".h -o -name "$PACKAGE"Type.hh -o -name "$PACKAGE".hh -o -name "$PACKAGE".irq \) -print
  find obj/$PACKAGE -type f \( -name 'Makefile' \) -print
  find examples/$PACKAGE obj/$PACKAGE src/$PACKAGE tools/$PACKAGE -type f -name "*-*" -print
}


#F files . . . . . . . . . . Lists all files to be moved into the STURM tree.

files() {
  if [ "$PACKAGE" = "Maintenance" ]; then
    echo Makefile
    find bin -type f -perm -110 ! -name '*~' ! -name '*.bak' -print
    find etc -type f ! -name '*~' ! -name '*.bak' -print
    find doc lib -type f \( -name 'Makefile' \) -print
    find doc -type f \( -name '*.texi' \) -print
    echo doc/Texi/Configuration.texi
    echo doc/Texi/Packages.head
    echo src
    echo include/"$ENVIRONMENT"Src
    echo include/$ENVIRONMENT
    echo obj
  fi
  find doc/Texi/$PACKAGE -type f \( -name '*.texi' \) -print
  find examples src tools -type f \
    \( -name '*.[ch]' -o -name '*.cc' -o -name '*.hh' -o -name '*.icc' -o \
       -name '*.tcc' -o -name '*.itc' -o -name '*.y' -o -name '*.l' -o \
       -name '*.irq' -o -name Makefile \) \
    -print
  find include/$ENVIRONMENT -name '*.hh' -print
  find include/$ENVIRONMENT -name '*.icc' -print
  find include/$ENVIRONMENT -name '*.itc' -print
  find obj -type f \( -name 'Makefile' \) -print
  find examples include obj src tools -type f -name "*-*" ! -name "*~" -print
}
#  find include/$ENVIRONMENT -type f \( -name '*.h' -o -name '*.hh' -o -name '*.irq' -o -name '*.icc' -o -name '*.itc'\) -print


#F getauthname . . . . . . . Sets the variable NAME to the name of the author.

getauthname() {
  NAME=$LOGNAME
  answer=n
  while [ "$answer" != "y" ]; do
    echo Your first and last names are: \"$NAME\"
    nlecho "Please enter 'y' if this is correct, 'n' otherwise: "
    read answer
    if [ "$answer" != "y" ]; then
      nlecho "Please enter your first and last names: "
      read NAME
    fi
  done
}


#Emacs . . . . . . . . . . . . . . . . . . . . . . . . Local emacs variables.
# Local Variables:
# outline-regexp:     " +# [0-9]\\|#[A-Za-z]"
# eval:               (outline-minor-mode)
# End:
