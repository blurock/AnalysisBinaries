#!/bin/csh
#
# FILE     CreateOperation
# PACKAGE  Maintenance
# AUTHORS  Edward S. Blurock
#
# CONTENT
#   Create Operation Specific code
#
#c COPYRIGHT (C) 1997 RISC Linz

if( $#argv <  1) then
    echo "Usage: CreateOperation.sh OperationClass
    echo "      Object:       The new Object (BaseDataObject)"
    exit(1)
endif

set OBJECT         = $1

set OBJECT_REPLACE    = =Object=

set PROTO_TYPE_CC  = $ANALYSIS_BASE/tools/ProtoTypes/OperationPrototype.cc

set CC_FILE        = Operation$OBJECT'.cc'

echo $CC_FILE

sed "s/$OBJECT_REPLACE/$OBJECT/g"\
     $PROTO_TYPE_CC >! $CC_FILE

exit(0)
