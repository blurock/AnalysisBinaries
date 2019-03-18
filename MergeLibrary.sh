#! /bin/tcsh -f

if( $#argv <  1) then
    echo   " Usage: $0 ModuleName"
    echo   "     ModuleName:  The development library of the module will be moved"
    exit(1)
endif

set ROOTNAME = $1


set LIBRARYDIR = $ANALYSIS_BASE/lib
set LIBTOMOVE = $ANALYSIS_DEVBASE/$ROOTNAME/lib/lib$ROOTNAME.a

if( -f $LIBTOMOVE) then
    echo Library file: $LIBTOMOVE will be moved to $LIBRARYDIR
    mv $LIBTOMOVE $LIBRARYDIR
elif
    echo Library file: $LIBTOMOVE not found, not moved
endif


