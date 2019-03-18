#!/bin/csh
#
# FILE     CreateAlgorihtm
# PACKAGE  Maintenance
# AUTHORS  Edward S. Blurock
#
# CONTENT
#   Create Algorithm Specific code
#
#c COPYRIGHT (C) 1997 Edward S. Blurock
set verbose on

if( $#argv <  1) then
    echo "Usage: CreateAlgorithm.sh AlgorithmClass"
    echo "      Object:       The new Object (BaseDataObject)"
    exit(1)
endif

set OBJECT         = $1

set OBJECT_REPLACE    = =Object=

set PROTO_TYPE_CC  = $ANALYSIS_BASE/tools/ProtoTypes/AlgorithmPrototype.cc

set CC_FILE        = Algorithm$OBJECT'.cc'

echo $CC_FILE

sed "s/$OBJECT_REPLACE/$OBJECT/g"\
     $PROTO_TYPE_CC >! $CC_FILE

exit(0)

